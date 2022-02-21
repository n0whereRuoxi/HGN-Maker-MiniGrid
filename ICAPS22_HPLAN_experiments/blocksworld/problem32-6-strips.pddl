( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b99 - block
    b807 - block
    b316 - block
    b201 - block
    b291 - block
    b949 - block
    b448 - block
    b913 - block
    b281 - block
    b52 - block
    b352 - block
    b953 - block
    b785 - block
    b791 - block
    b239 - block
    b526 - block
    b153 - block
    b304 - block
    b863 - block
    b743 - block
    b377 - block
    b879 - block
    b33 - block
    b36 - block
    b350 - block
    b549 - block
    b855 - block
    b546 - block
    b702 - block
    b490 - block
    b911 - block
    b424 - block
    b880 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b99 )
    ( on b807 b99 )
    ( on b316 b807 )
    ( on b201 b316 )
    ( on b291 b201 )
    ( on b949 b291 )
    ( on b448 b949 )
    ( on b913 b448 )
    ( on b281 b913 )
    ( on b52 b281 )
    ( on b352 b52 )
    ( on b953 b352 )
    ( on b785 b953 )
    ( on b791 b785 )
    ( on b239 b791 )
    ( on b526 b239 )
    ( on b153 b526 )
    ( on b304 b153 )
    ( on b863 b304 )
    ( on b743 b863 )
    ( on b377 b743 )
    ( on b879 b377 )
    ( on b33 b879 )
    ( on b36 b33 )
    ( on b350 b36 )
    ( on b549 b350 )
    ( on b855 b549 )
    ( on b546 b855 )
    ( on b702 b546 )
    ( on b490 b702 )
    ( on b911 b490 )
    ( on b424 b911 )
    ( on b880 b424 )
    ( clear b880 )
  )
  ( :goal
    ( and
      ( clear b99 )
    )
  )
)
