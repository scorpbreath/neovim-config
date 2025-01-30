require('lualine').setup({
  options = {
    theme = 'github',  -- Тема панели, можешь заменить на любую другую (например, 'one', 'nightfly', 'tokyonight')
    section_separators = {'', ''},  -- Разделители между секциями (оставить пустыми для простоты)
    component_separators = {'', ''},  -- Разделители между компонентами
  },
  sections = {
    lualine_a = {'mode'},  -- Отображение текущего режима (например, нормальный режим, вставка и т.д.)
    lualine_b = {'branch', 'diff'},  -- Текущая ветка git и изменения в файлах
    lualine_c = {'filename'},  -- Имя текущего файла
    lualine_x = {'encoding', 'fileformat', 'filetype'},  -- Информация о кодировке, формате файла, типе файла
    lualine_y = {'progress'},  -- Прогресс (например, позиция в файле)
    lualine_z = {'location'}  -- Строка и колонка
  },
  extensions = {'fugitive'}  -- Расширения (например, интеграция с git)
})
