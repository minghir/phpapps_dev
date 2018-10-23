<?php

class Calculator
{
    private function _expression_() {
        $__0__ = TRUE;
        if (($__1__ = $this->_component_()) !== NULL) {
            $__0__ = $__1__;
        }
        else if (($__1__ = $this->_expression_()) !== NULL) {
            if ($this->_currentTokenLexeme() === '+') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_component_()) !== NULL) {
                    $__0__ = $__1__ + $__3__;
                }
                else {
                    $__0__ = NULL;
                }

            }
            else if ($this->_currentTokenLexeme() === '-') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_component_()) !== NULL) {
                    $__0__ = $__1__ - $__3__;
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
            $__0__ = 0;
        }
        return $__0__;
    }

    private function _factor_() {
        $__0__ = TRUE;
        if ($this->_currentTokenType() === self::NUMBER) {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            $__0__ = intval($__1__);
        }
        else if ($this->_currentTokenLexeme() === '(') {
            $__1__ = $this->_currentToken();
            $this->_nextToken();
            if (($__2__ = $this->_expression_()) !== NULL) {
                if ($this->_currentTokenLexeme() === ')') {
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

    private function _component_() {
        $__0__ = TRUE;
        if (($__1__ = $this->_factor_()) !== NULL) {
            $__0__ = $__1__;
        }
        else if (($__1__ = $this->_component_()) !== NULL) {
            if ($this->_currentTokenLexeme() === '*') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_factor_()) !== NULL) {
                    $__0__ = $__1__ * $__3__;
                }
                else {
                    $__0__ = NULL;
                }

            }
            else if ($this->_currentTokenLexeme() === '/') {
                $__2__ = $this->_currentToken();
                $this->_nextToken();
                if (($__3__ = $this->_factor_()) !== NULL) {
                    $__0__ = $__1__ / $__3__;
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

    private function doParse() {
        return $this->_expression_();
    }
    private function _currentToken() {

    return $this->token;

    }

    private function _currentTokenType() {

    if (preg_match('~^[0-9]+$~', $this->token)) {
        return self::NUMBER;
    }
    return NULL;

    }

    private function _currentTokenLexeme() {

    return $this->token;

    }

    private function _nextToken() {

    if (!preg_match('~^([0-9]+|\(|\)|\+|-|\*|/)~', $this->expression, $m)) {
        $this->expression = NULL;
        $this->token = NULL;
        return;
    }
print_r($m);
    $this->token = $m[1];
	
    $this->expression = substr($this->expression, strlen($m[1]));

    }



    const NUMBER = 1;

    private $expression;
    private $token;

    public function calculate($expression)
    {
        $this->expression = $expression;
        $this->_nextToken();
        return $this->doParse();
    }

}

    $calculator = new Calculator;
    echo $calculator->calculate('1+2'); 
	echo $calculator->calculate('2');
				
				
