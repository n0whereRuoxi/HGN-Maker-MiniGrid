( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b125 - block
    b583 - block
    b868 - block
    b843 - block
    b496 - block
    b941 - block
    b445 - block
    b784 - block
    b570 - block
    b255 - block
    b454 - block
    b128 - block
    b900 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b125 )
    ( on b583 b125 )
    ( on b868 b583 )
    ( on b843 b868 )
    ( on b496 b843 )
    ( on b941 b496 )
    ( on b445 b941 )
    ( on b784 b445 )
    ( on b570 b784 )
    ( on b255 b570 )
    ( on b454 b255 )
    ( on b128 b454 )
    ( on b900 b128 )
    ( clear b900 )
  )
  ( :goal
    ( and
      ( clear b125 )
    )
  )
)
