( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b264 - block
    b640 - block
    b333 - block
    b207 - block
    b240 - block
    b860 - block
    b712 - block
    b642 - block
    b255 - block
    b659 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b264 )
    ( on b640 b264 )
    ( on b333 b640 )
    ( on b207 b333 )
    ( on b240 b207 )
    ( on b860 b240 )
    ( on b712 b860 )
    ( on b642 b712 )
    ( on b255 b642 )
    ( on b659 b255 )
    ( clear b659 )
  )
  ( :goal
    ( and
      ( clear b264 )
    )
  )
)
