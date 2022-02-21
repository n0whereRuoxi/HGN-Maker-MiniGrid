( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b401 - block
    b260 - block
    b898 - block
    b883 - block
    b584 - block
    b684 - block
    b326 - block
    b69 - block
    b911 - block
    b175 - block
    b426 - block
    b720 - block
    b72 - block
    b295 - block
    b520 - block
    b586 - block
    b784 - block
    b216 - block
    b44 - block
    b638 - block
    b16 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b401 )
    ( on b260 b401 )
    ( on b898 b260 )
    ( on b883 b898 )
    ( on b584 b883 )
    ( on b684 b584 )
    ( on b326 b684 )
    ( on b69 b326 )
    ( on b911 b69 )
    ( on b175 b911 )
    ( on b426 b175 )
    ( on b720 b426 )
    ( on b72 b720 )
    ( on b295 b72 )
    ( on b520 b295 )
    ( on b586 b520 )
    ( on b784 b586 )
    ( on b216 b784 )
    ( on b44 b216 )
    ( on b638 b44 )
    ( on b16 b638 )
    ( clear b16 )
  )
  ( :goal
    ( and
      ( clear b401 )
    )
  )
)
