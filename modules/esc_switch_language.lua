-- ref: https://frhyme.github.io/hammerspoon/hammerspoon00_use_esc_to_input_en/
-- 이건 일종의 리스너륾 만든거임. 키가 입력되면 걔가 특정 키인지 확인하고, 해당되는 행위를 수행하도록 함.
-- hs.eventtap.event.types.keyDown: modifier key가 아닌 다른 일반 key에 down이 발생했을 때
-- 입력된 key의 code가 'escape'이면 input_source를 확인하고 영어가 아닐 경우 영어로 변환해준다.
escape_keyevent = hs.eventtap.new (
  {hs.eventtap.event.types.keyDown},
  function (event)
    local flags = event:getFlags()
    local keycode = hs.keycodes.map[event:getKeyCode()]

    if (keycode == 'escape') then
      -- print("This is escape")
      local input_korean = "com.apple.inputmethod.Korean.2SetKorean"
      local input_english = "com.apple.keylayout.ABC"

      local input_source = hs.keycodes.currentSourceID()

      if (input_source ~= input_english) then
        hs.keycodes.currentSourceID(input_english)
      end
    end
  end
)
escape_keyevent:start()