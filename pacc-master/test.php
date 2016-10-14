<?php
/*LIBS*/

error_reporting(~E_STRICT);

require_once 'lib/exceptions.php';

require_once 'lib/PaccSet.php';
require_once 'lib/PaccGrammar.php';
require_once 'lib/PaccSymbol.php';
require_once 'lib/PaccNonterminal.php';
require_once 'lib/PaccTerminal.php';
require_once 'lib/PaccProduction.php';

require_once 'lib/PaccToken.php';
require_once 'lib/tokens.php';
require_once 'lib/PaccTokenStream.php';
require_once 'lib/PaccTokenFilterOutStream.php';
require_once 'lib/PaccLexer.php';

require_once 'lib/PaccParser.php';

require_once 'lib/PaccGenerator.php';

require_once 'lib/PaccRDGenerator.php';

require_once 'lib/PaccLRGenerator.php';
require_once 'lib/PaccLRItem.php';
require_once 'lib/PaccLRJump.php';
/*ENDLIBS*/

$algorithms = array(
    'RD' => 'recursive descent',
    'LR' => 'canonical LR(1)',
);
/*
$opts = array_merge(array(
    'i' => '-', 
    'o' => '-'
), getopt('hi:o:fa:'));


if (isset($opts['h'])) { $h = <<<E
{$_SERVER['argv'][0]} [ -h ] [ -i <input> ] [ -f ] [ -o <output> ] [ -a <algorithm> ]
    -h              show this help
    -i <input>      input file
    -f              force output file overwrite if exists
    -o <output>     output file
    -a <algorithm>  algorithm for generated  parser (default RD)
                    (use `help` to show available algorithms)

E;
die($h); }

if (isset($opts['a']) && $opts['a'] === 'help') {
    foreach ($algorithms as $algorithm => $description) {
        echo $algorithm . ': ' . $description . PHP_EOL;
    }
    die();
}

if ($opts['i'] === '-') { $opts['i'] = 'php://stdin'; }
if ($opts['o'] === '-') { $opts['o'] = 'php://stdout'; }
*/

$opts['a'] = 'RD';

try {
    //$lines = @file($opts['i']);
	$lines = file("examples/json.y");
    if ($lines === FALSE) { throw new Exception('Cannot read input file.'); }

    $stream = new PaccTokenFilterOutStream(
        PaccLexer::fromString(implode('', $lines)),
        array('PaccWhitespaceToken', 'PaccCommentToken')
    );
    $parser = new PaccParser($stream);
    $grammar = $parser->parse();

    if (empty($grammar->name)) {
        throw new Exception('`grammar` statement omitted. Cannot generated parser.');
    }

    if (!isset($opts['a'])) {
        if (isset($grammar->options['algorithm'])) {
            $opts['a'] = $grammar->options['algorithm'];
        } else {
            $opts['a'] = current(array_keys($algorithms));
        }
    }

    if (!isset($algorithms[$opts['a']])) {
        throw new Exception('Unknown algorithm `' . $opts['a'] . '`.');
    }

    $generatorclass = 'Pacc' . $opts['a'] . 'Generator';
    $generator = new $generatorclass($grammar);
/*
    if (file_exists($opts['o']) && !isset($opts['f'])) {
        throw new Exception('Output file already exists. Use -f to force overwrite.');
    }
*/
    $generator->writeToFile("tmp/cc.php");

} catch (PaccUnexpectedToken $e) {
    file_put_contents('php://stderr', 
        $e->getMessage() . PHP_EOL . 
        ((string) $e->token->line) . ': ' . rtrim($lines[$e->token->line - 1]) . PHP_EOL .
        str_repeat(' ', strlen((string) $e->token->line) + $e->token->position + 1) . '^' . PHP_EOL
    );
    die(-1);
} catch (PaccUnexpectedEnd $e) {
    file_put_contents('php://stderr', 
        $e->getMessage() . PHP_EOL
    );
    die(-1);
} catch (PaccBadIdentifier $e) {
    file_put_contents('php://stderr', 
        $e->getMessage() . PHP_EOL . 
        ((string) $e->token->line) . ': ' . rtrim($lines[$e->token->line - 1]) . PHP_EOL .
        str_repeat(' ', strlen((string) $e->token->line) + $e->token->position + 1) . '^' . PHP_EOL
    );
    die(-1);
} catch (Exception $e) {
    file_put_contents('php://stderr', 
        $e->getMessage() . PHP_EOL
    );
    die(-1);
}
