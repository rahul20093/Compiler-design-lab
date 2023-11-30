#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int isOperator(char ch) {
    return (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^');
}


int getPrecedence(char op) {
    if (op == '^') return 3;  
    if (op == '*' || op == '/') return 2;
    if (op == '+' || op == '-') return 1;
    return 0;  
}


void parseExpression(char expression[]) {
    char stack[100]; 
    int top = -1;    

    printf("Operator Precedence Parsing for Expression: %s\n", expression);

    for (int i = 0; expression[i] != '\0'; i++) {
        if (isOperator(expression[i])) {
         
            while (top >= 0 && getPrecedence(stack[top]) >= getPrecedence(expression[i])) {
                printf("%c ", stack[top]);
                top--;
            }
   
            stack[++top] = expression[i];
        } else if (expression[i] == '(') {
  
            stack[++top] = expression[i];
        } else if (expression[i] == ')') {
   
            while (top >= 0 && stack[top] != '(') {
                printf("%c ", stack[top]);
                top--;
            }

            if (top >= 0) {
                top--;
            } else {
                printf("Error: Mismatched parentheses\n");
                exit(1);
            }
        } else {

            printf("%c ", expression[i]);
        }
    }


    while (top >= 0) {
        if (stack[top] == '(' || stack[top] == ')') {
            printf("Error: Mismatched parentheses\n");
            exit(1);
        }
        printf("%c ", stack[top]);
        top--;
    }

    printf("\n");
}

int main() {
    char expression[100];


    printf("Enter an arithmetic expression: ");
    fgets(expression, sizeof(expression), stdin);

    int len = strlen(expression);
    if (len > 0 && expression[len - 1] == '\n') {
        expression[len - 1] = '\0';
    }


    parseExpression(expression);

    return 0;
}
