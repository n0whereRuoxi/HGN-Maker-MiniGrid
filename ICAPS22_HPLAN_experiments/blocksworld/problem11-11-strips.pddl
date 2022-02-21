( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b784 - block
    b659 - block
    b96 - block
    b798 - block
    b240 - block
    b829 - block
    b956 - block
    b169 - block
    b997 - block
    b60 - block
    b601 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b784 )
    ( on b659 b784 )
    ( on b96 b659 )
    ( on b798 b96 )
    ( on b240 b798 )
    ( on b829 b240 )
    ( on b956 b829 )
    ( on b169 b956 )
    ( on b997 b169 )
    ( on b60 b997 )
    ( on b601 b60 )
    ( on b794 b601 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b784 )
    )
  )
)
