( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b757 - block
    b451 - block
    b569 - block
    b235 - block
    b440 - block
    b802 - block
    b436 - block
    b955 - block
    b759 - block
    b276 - block
    b693 - block
    b864 - block
    b676 - block
    b543 - block
    b597 - block
    b977 - block
    b19 - block
    b968 - block
    b587 - block
    b156 - block
    b719 - block
    b272 - block
    b49 - block
    b36 - block
    b575 - block
    b304 - block
    b566 - block
    b838 - block
    b214 - block
    b95 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b757 )
    ( on b451 b757 )
    ( on b569 b451 )
    ( on b235 b569 )
    ( on b440 b235 )
    ( on b802 b440 )
    ( on b436 b802 )
    ( on b955 b436 )
    ( on b759 b955 )
    ( on b276 b759 )
    ( on b693 b276 )
    ( on b864 b693 )
    ( on b676 b864 )
    ( on b543 b676 )
    ( on b597 b543 )
    ( on b977 b597 )
    ( on b19 b977 )
    ( on b968 b19 )
    ( on b587 b968 )
    ( on b156 b587 )
    ( on b719 b156 )
    ( on b272 b719 )
    ( on b49 b272 )
    ( on b36 b49 )
    ( on b575 b36 )
    ( on b304 b575 )
    ( on b566 b304 )
    ( on b838 b566 )
    ( on b214 b838 )
    ( on b95 b214 )
    ( clear b95 )
  )
  ( :goal
    ( and
      ( clear b757 )
    )
  )
)
