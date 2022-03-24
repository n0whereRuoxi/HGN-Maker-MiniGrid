( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b933 - block
    b676 - block
    b582 - block
    b864 - block
    b620 - block
    b846 - block
    b424 - block
    b820 - block
    b473 - block
    b410 - block
    b453 - block
    b896 - block
    b280 - block
    b805 - block
    b660 - block
    b901 - block
    b106 - block
    b140 - block
    b993 - block
    b25 - block
    b112 - block
    b322 - block
    b492 - block
    b358 - block
    b516 - block
    b454 - block
    b634 - block
    b923 - block
    b365 - block
    b536 - block
    b75 - block
    b603 - block
    b32 - block
    b919 - block
    b325 - block
    b529 - block
    b259 - block
    b910 - block
    b973 - block
    b738 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b933 )
    ( on b676 b933 )
    ( on b582 b676 )
    ( on b864 b582 )
    ( on b620 b864 )
    ( on b846 b620 )
    ( on b424 b846 )
    ( on b820 b424 )
    ( on b473 b820 )
    ( on b410 b473 )
    ( on b453 b410 )
    ( on b896 b453 )
    ( on b280 b896 )
    ( on b805 b280 )
    ( on b660 b805 )
    ( on b901 b660 )
    ( on b106 b901 )
    ( on b140 b106 )
    ( on b993 b140 )
    ( on b25 b993 )
    ( on b112 b25 )
    ( on b322 b112 )
    ( on b492 b322 )
    ( on b358 b492 )
    ( on b516 b358 )
    ( on b454 b516 )
    ( on b634 b454 )
    ( on b923 b634 )
    ( on b365 b923 )
    ( on b536 b365 )
    ( on b75 b536 )
    ( on b603 b75 )
    ( on b32 b603 )
    ( on b919 b32 )
    ( on b325 b919 )
    ( on b529 b325 )
    ( on b259 b529 )
    ( on b910 b259 )
    ( on b973 b910 )
    ( on b738 b973 )
    ( clear b738 )
  )
  ( :goal
    ( and
      ( clear b933 )
    )
  )
)
