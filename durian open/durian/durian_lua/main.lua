Test_mode = false
Version = " A 0.1.2.1"
function Clear() -- очистка
  os.execute("cls 2>nul")
  os.execute("clear 2>/dev/null")
end

function Delay(sec) -- ОЖИДАНИЕ
  os.execute("timeout /t " .. sec .. " /nobreak >nul 2>nul")
  os.execute("sleep " .. sec .. " 2>/dev/null")
end

function Input(type) -- input
  if type == "n" then
    local num = io.read("*n")
    io.read("*l")
    return num
  else
    return io.read("*l")
  end
end

function Exit() -- выход
  print("выходим из системы...")
  Delay(2)
  print("до свидания!")
  os.exit(0,"вы вышли из системы")
end
Commands ={
["add"] = {
  execute = function ()
    print("первое число:")
    local a = Input("n")
    print("второе число:")
    local b = Input("n")
    print("итог сложения:",a + b)
  end
  },
["multiply"] = {
    execute = function ()
    print("первое число:")
    local a = Input("n")
    print("второе число:")
    local b = Input("n")
    print("итог умножения:",a * b)
    end
  },
["subtraction"] = {
  execute = function ()
  print("первое число:")
  local a = Input("n")
  print("второе число:")
  local b = Input("n")
  print("итог вычетания:",a - b)
  end
},
["division"] = {
    execute = function ()
    print("первое число:")
    local a = Input("n")
    print("второе число:")
    local b = Input("n")
    print("итог деления:",a / b)
    end
},
["vibi is not vim"] = {
  execute = function ()
    Clear()
    print("это правда.")
    Delay(2)
    print("ты")
    Delay(1)
    print("знаеш")
    Delay(1)
    print("исходный код?")
    Delay(2)
    print("верно?")
    Delay(1)
    print("может тебе сказали,сам написл что-то случайное?")
    Delay(3)
    print("ладно...пока,удачи")
    Delay(3)
    Clear()
    error("НАЙДЕНА ПОСХАЛКА!",666)
  end
},
["help"] = {
  execute =function ()
  print("")
  print("сложение -- add")
  print("вычетание -- subtraction")
  print("умножение -- multiply")
  print("деление -- division")
  print("очистка -- clear")
  print("время -- time")
  print("дата -- date")
  print("выход в bios -- bios")
  print("выход -- exit")
  if Test_mode == true then
    print("изменить файл(ТЕСТОВАЯ ФУНКЦИЯ!) -- edit")
  end
  end
},
["clear"] = {
  execute = function ()
  print("очистка...")
  Delay(1)
  Clear()
  end
},
["time"] = {
  execute = function ()
  local time = os.date("%H ч %M мин %S сек")
  print("сейчас",time)
  end
},
["edit"] = {
  execute = function ()
  if Test_mode == true then
    print("продолжение следует -->")
  end
  end

},
["date"] = {
  execute = function ()
    local Date = os.date("%Y год %m месяц %d день")
    print(Date)
  end
},
["bios"] = {
  execute = function ()
    Test_mode = false
    print("возрашаем в местный bios...")
    Delay(3)
    First_start()
  end
}
}

function First_start() -- типа bios
  Clear()
  print("версия".. Version)
  print("1) cтарт", "2) настройки запуска", "3) выход")
  print("введите толко цифру вашего выбора:")
  local start_func = io.read("*n")
  io.read()
  if start_func == 1 then
    print("запуск...")
    Delay(3)
    Clear()
    Operation_sistem()
  elseif start_func == 3 then
    Exit()
  elseif start_func == 2 then
    Start_settings()
  end
end
function Start_settings() -- настройки
  Clear()
  print("0)отмена 1) включить тестовые функции   2)в разработке....")
  local setrings_func = Input("n")
  if setrings_func == 0 then
    First_start()
  elseif  setrings_func == 1 then
    print("запуск тестовой версии ...")
    Delay(3)
    Clear()
    Test_mode = true
    Operation_sistem()
  end
end
function Operation_sistem() -- cобственно сама ос
  if UserName == nil then
    print("введите ваше имя пользователя ...")
    UserName = Input("l")
  end
  print("Здравствуйте ",UserName)
  Delay(1)
  Clear()
  while true do
    print(UserName,"введите команду(help для помощи):")
    User_command = Input("l")
    User_command = User_command:lower()
    if Commands[User_command] then
      Commands[User_command].execute()
    elseif User_command == "exit" then
      Exit()
      print("как?")
    end
  end
end

First_start()
