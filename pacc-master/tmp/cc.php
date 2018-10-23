<?php

/**
 * JSON encoding and decoding; does not depend on any PHP module
 */

class json
{
    private function _value_() {
        $__0__ = TRUE;
        if ($this->_currentTokenType() === self::STRING) {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            $__0__ = $this->stringDecode($__1__->lexeme);
        }
        else if ($this->_currentTokenType() === self::NUMBER) {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            $__0__ = floatval($__1__->lexeme);
        }
        else if (($__1__ = $this->_object_()) !== NULL) {
            if (!$this->associative) { $__1__ = (object) $__1__; } $__0__ = $__1__;
        }
        else if (($__1__ = $this->_array_()) !== NULL) {
            $__0__ = $__1__;
        }
        else if ($this->_currentTokenLexeme() === 'true') {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            $__0__ = TRUE;
        }
        else if ($this->_currentTokenLexeme() === 'false') {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            $__0__ = FALSE;
        }
        else if ($this->_currentTokenLexeme() === 'null') {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            $__0__ = NULL;
        }
        else {
            $__0__ = NULL;
        }
        return $__0__;
    }

    private function _object_() {
        $__0__ = TRUE;
        if ($this->_currentTokenLexeme() === '{') {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            if (($__2__ = $this->_pairs_()) !== NULL) {
                if ($this->_currentTokenLexeme() === '}') {
                    $__3__ = $this->_currentToken();
                    $this->_nextToken();
                    $__0__ = $__2__;
                }
                else {
                    $__0__ = NULL;
                }

            }
            else {
                $__0__ = NULL;
            }

        }
        else {
            $__0__ = NULL;
        }
        return $__0__;
    }

    private function _pairs_() {
        $__0__ = TRUE;
        if (($__1__ = $this->_pair_()) !== NULL) {
            if ($this->_currentTokenLexeme() === ',') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_pairs_()) !== NULL) {
                    $__0__ = array_merge(array($__1__[0] => $__1__[1]), $__3__);
                }
                else {
                    $__0__ = NULL;
                }

            }
            else {
                $__0__ = array($__1__[0] => $__1__[1]);
            }

        }
        else {
            $__0__ = array();
        }
        return $__0__;
    }

    private function _pair_() {
        $__0__ = TRUE;
        if ($this->_currentTokenType() === self::STRING) {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            if ($this->_currentTokenLexeme() === ':') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_value_()) !== NULL) {
                    $__0__ = array($__1__->lexeme, $__3__);
                }
                else {
                    $__0__ = NULL;
                }

            }
            else {
                $__0__ = NULL;
            }

        }
        else {
            $__0__ = NULL;
        }
        return $__0__;
    }

    private function _array_() {
        $__0__ = TRUE;
        if ($this->_currentTokenLexeme() === '[') {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            if (($__2__ = $this->_values_()) !== NULL) {
                if ($this->_currentTokenLexeme() === ']') {
                    $__3__ = $this->_currentToken();
                    $this->_nextToken();
                    $__0__ = $__2__;
                }
                else {
                    $__0__ = NULL;
                }

            }
            else {
                $__0__ = NULL;
            }

        }
        else {
            $__0__ = NULL;
        }
        return $__0__;
    }

    private function _values_() {
        $__0__ = TRUE;
        if (($__1__ = $this->_value_()) !== NULL) {
            if ($this->_currentTokenLexeme() === ',') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_values_()) !== NULL) {
                    $__0__ = array_merge(array($__1__), $__3__);
                }
                else {
                    $__0__ = NULL;
                }

            }
            else {
                $__0__ = array($__1__);
            }

        }
        else {
            $__0__ = array();
        }
        return $__0__;
    }

    private function doParse() {
        return $this->_value_();
    }
    private function _currentToken() {

    return $this->token;

    }

    private function _currentTokenType() {

    return $this->token->type;

    }

    private function _currentTokenLexeme() {

    return $this->token->lexeme;

    }

    private function _nextToken() {

    if (empty($this->json)) {
        $this->token = (object) array(
            'type' => NULL,
            'lexeme' => NULL
        );

        return ;
    }

    $ok = FALSE;

    foreach (array(
        array(self::STRING, self::STRINGREGEX),
        array(self::NUMBER, self::NUMBERREGEX),
        array(self::SPECIAL, self::SPECIALREGEX),
        array(self::KEYWORD, self::KEYWORDREGEX)) as $pair)
    {
        if (preg_match($pair[1], $this->json, $m)) {
            $this->token = (object) array(
                'type' => $pair[0], 
                'lexeme' => $m[1]
            );

            $ok = TRUE;

            break;
        }
    }

    if (!$ok) { throw new Exception(NULL); }

    $this->json = ltrim(substr($this->json, strlen($m[0])));

    }



    const
        STRING = 1,
        NUMBER = 2,
        SPECIAL = 3,
        KEYWORD = 4;

    const
        SPECIALREGEX = '#^(\\{|:|,|\\}|\\[|\\])#',
        KEYWORDREGEX = '#^(true|false|null)#',
        STRINGREGEX = '#^"(([^"\\\\]|\\\\["\\\\/bfnrt]|\\\\u[0-9a-fA-F]{4})*)"#',
        NUMBERREGEX = '#^(-?(0|[1-9][0-9]*)(\\.[0-9]+([eE][+-]?[0-9]+)?)?)#';

    /**
     * Conversion from escape sequences to characters
     * @var array
     */
    private static $escapes = array(
        '\"' => '"', 
        '\\\\' => '\\',
        '\b' => "\b",
        '\f' => "\f",
        '\n' => "\n",
        '\r' => "\r",
        '\t' => "\t"
    );

    /**
     * JSON serialized data
     * @var string
     */
    private $json;

    /**
     * Whether JSON objects should be returned as associative arrays
     * @var bool
     */
    private $associative = FALSE;

    /**
     * Current token
     */
    private $token;

    /**
     * Decodes JSON serialized string
     * @param string
     * @param bool whether JSON objects should be decoded as PHP arrays, not stdClass
     * @return mixed
     */
    public static function decode($json, $associative = FALSE)
    {
        $instance = new self;
        $instance->associative = $associative;
        return $instance->parse($json);
    }

    /**
     * Encodes PHP value to JSON
     * @param mixed
     * @return string
     */
    public static function encode($val, $force_object = FALSE)
    {
        if (is_array($val) && ((empty($val) && !$force_object) ||
            array_keys($val) === range(0, count($val) - 1)))
        {
            $ret = array();
            foreach ($val as $v) { $ret[] = self::encode($v, $force_object); }
            return '[' . implode(',', $ret) . ']';
        }

        if (is_array($val) || is_object($val)) {
            $ret = array();
            foreach ($val as $k => $v) { $ret[] = self::encode((string) $k) . ':' . self::encode($v); };
            return '{' . implode(',', $ret) . '}';
        }

        if (is_string($val)) {
            return '"' . strtr($val, array_flip(self::$escapes)) . '"';
        }

        if (is_int($val) || is_float($val) || is_bool($val)) {
            return var_export($val, TRUE);
        }

        return 'null';
    }

    /**
     * Not supposed to be initialized
     */
    private function __construct() {}

    /**
     * Parses given JSON string
     * @return mixed decoded JSON value
     */
    private function parse($json)
    {
        $this->json = ltrim($json);
        $this->_nextToken();
        try {
            $ret = $this->doParse();
            if ($ret === 0) { return NULL; }
            return $ret;
        } catch (Exception $e) {
            return NULL;
        }
    }

    /**
     * Decode JSON encoded string
     * @param string
     * @return string
     */
    private function stringDecode($s)
    {
        $ret = '';

        $i = 0;
        foreach (explode("\xff", preg_replace('#\\\\u([0-9a-fA-F]{4})#',
            "\xff\$1\xff", strtr($s, self::$escapes))) as $part)
        {
            if ($i & 1) { // unicode escape sequence
                $c = hexdec($part);

                if ($c < 0x80) { $ret .= chr($c); }
                else if ($c < 0x0800) { $ret .= chr(($c >> 6) | 0xC0) . chr(($c & 0x3F) | 0x80); }
                else if ($c < 0x10000) { $ret .= chr(($c >> 12) | 0xE0) . chr((($c >> 6) & 0x3F) | 0x80) . chr(($c & 0x3F) | 0x80); }
                else if ($c < 0x200000) { $ret .= chr(($c >> 18) | 0xF0) . chr((($c >> 12) & 0x3F) | 0x80) . chr((($c >> 6) & 0x3F) | 0x80) . chr(($c & 0x3F) | 0x80); }
                else { $ret .= '?'; }

            } else { $ret .= $part; }

            ++$i;
        }

        return $ret;
    }

}
