#include <iostream>
#include <windows.h>
#include <string>

using namespace std;

int clear() {
    cout << "\033[2J\033[3J\033[H" << flush;
    return 0;
}

////////////////////////////////////////////////////////////
string user_names[8];
int count_usr = 0;
string user_command;
string color_fon = "0";
string color_text = "7";
////////////////////////////////////////////////////////////

int sistems() { // cистема
    while (true) {
        cout << user_names[count_usr] << " введите команду(help для помощи): ";
        cin >> user_command;

        if (user_command == "calk") { // калькулятор
            float num1;
            float num2;
            char sym;
            cout << "введите первое число: ";
            cin >> num1;
            cout << "введите что хотите выполнить + - * /" << endl;
            cin >> sym;
            cout << "введите второе число: ";
            cin >> num2;
            cout << "ответ" << endl;
            switch (sym) {
            case '+': cout << num1 + num2 << endl; break;
            case '-': cout << num1 - num2 << endl; break;
            case '*': cout << num1 * num2 << endl; break;
            case '/': cout << num1 / num2 << endl; break;
            }
        }
        else if (user_command == "clear") { // очистка
            clear();
        }
        else if (user_command == "exit") {
            return 0; // Возврат в main
        }
        else if (user_command == "user_set") {
            cout << "введите адрес пользователя(0 - 7): ";
            cin >> count_usr;
            if (user_names[count_usr] == "") {
                cout << "введите имя пользователя: ";
                cin >> user_names[count_usr];
            }
        }
        else if (user_command == "set_user_name") {
            cout << "введите имя пользователя: ";
            cin >> user_names[count_usr];
        }
        else if (user_command == "help") {
            cout << "calk -- калькулятор" << endl;
            cout << "clear -- очистка" << endl;
            cout << "exit -- выход" << endl;
            cout << "user_set -- изменить пользователя" << endl;
            cout << "set_user_name -- изменить имя пользователя" << endl;
        }
    }
    return 0;
}

//////////////////////////////////////////////////////////////////////////////

int main() {
    setlocale(LC_ALL, "RU");
    setlocale(LC_ALL, ".65001");
    //system("color 20");
    int starter_ftv;

    cout << "добро пожаловать в дуриан os (win 10/11 viresion)" << endl;
    Sleep(1500);

    while (true) {
        cout << "1) запуск 2) настройки 3) выход" << endl;
        cin >> starter_ftv;

        switch (starter_ftv) {
        case 1:
            cout << "запускаем..." << endl;
            Sleep(2000);
            clear();
            cout << "введите ваше имя пользователя" << endl;
            if (count_usr <= 7) {
                cin >> user_names[count_usr];
                Sleep(1000);
                clear();
                sistems();
            }
            else {
                cout << "сдышком много пользователей";
            }
            break;

        case 2:
            cout << "1)изменить цвет текста 2)изменить цвет фона" << endl;
            cin >> user_command;
            if (user_command == "1") {
                cout << "введите 0 = Черный 8 = Серый \n"
                    "1 = Синий 9 = Светло - синий \n"
                    "2 = Зеленый A = Светло - зеленый \n"
                    "3 = Голубой B = Светло - голубой \n"
                    "4 = Красный C = Светло - красный \n"
                    "5 = Лиловый D = Светло - лиловый \n"
                    "6 = Желтый E = Светло - желтый \n"
                    "7 = Белый F = Ярко - белый \n";
                cin >> color_text;
                string colors_sets = "color " + color_fon + color_text;
                system(colors_sets.c_str());
            }
            if (user_command == "2") {
                cout << "введите 0 = Черный 8 = Серый \n"
                    "1 = Синий 9 = Светло - синий \n"
                    "2 = Зеленый A = Светло - зеленый \n"
                    "3 = Голубой B = Светло - голубой \n"
                    "4 = Красный C = Светло - красный \n"
                    "5 = Лиловый D = Светло - лиловый \n"
                    "6 = Желтый E = Светло - желтый \n"
                    "7 = Белый F = Ярко - белый \n";
                cin >> color_fon;
                string colors_sets = "color " + color_fon + color_text;
                system(colors_sets.c_str());
            }
            break;

        case 3:
            exit(0);
        }
        clear();
    }
    return 0;
}
