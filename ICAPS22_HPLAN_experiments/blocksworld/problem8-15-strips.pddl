( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b817 - block
    b119 - block
    b403 - block
    b154 - block
    b295 - block
    b181 - block
    b962 - block
    b101 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b817 )
    ( on b119 b817 )
    ( on b403 b119 )
    ( on b154 b403 )
    ( on b295 b154 )
    ( on b181 b295 )
    ( on b962 b181 )
    ( on b101 b962 )
    ( on b255 b101 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b817 )
    )
  )
)
