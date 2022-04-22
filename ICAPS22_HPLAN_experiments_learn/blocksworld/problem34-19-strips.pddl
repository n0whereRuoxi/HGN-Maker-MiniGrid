( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b975 - block
    b117 - block
    b101 - block
    b458 - block
    b520 - block
    b107 - block
    b644 - block
    b408 - block
    b324 - block
    b538 - block
    b320 - block
    b365 - block
    b531 - block
    b503 - block
    b345 - block
    b407 - block
    b69 - block
    b557 - block
    b73 - block
    b800 - block
    b225 - block
    b751 - block
    b973 - block
    b816 - block
    b850 - block
    b374 - block
    b539 - block
    b747 - block
    b59 - block
    b551 - block
    b218 - block
    b318 - block
    b910 - block
    b686 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b975 )
    ( on b117 b975 )
    ( on b101 b117 )
    ( on b458 b101 )
    ( on b520 b458 )
    ( on b107 b520 )
    ( on b644 b107 )
    ( on b408 b644 )
    ( on b324 b408 )
    ( on b538 b324 )
    ( on b320 b538 )
    ( on b365 b320 )
    ( on b531 b365 )
    ( on b503 b531 )
    ( on b345 b503 )
    ( on b407 b345 )
    ( on b69 b407 )
    ( on b557 b69 )
    ( on b73 b557 )
    ( on b800 b73 )
    ( on b225 b800 )
    ( on b751 b225 )
    ( on b973 b751 )
    ( on b816 b973 )
    ( on b850 b816 )
    ( on b374 b850 )
    ( on b539 b374 )
    ( on b747 b539 )
    ( on b59 b747 )
    ( on b551 b59 )
    ( on b218 b551 )
    ( on b318 b218 )
    ( on b910 b318 )
    ( on b686 b910 )
    ( on b309 b686 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b975 )
    )
  )
)
