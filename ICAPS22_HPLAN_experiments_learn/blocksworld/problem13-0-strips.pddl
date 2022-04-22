( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b999 - block
    b531 - block
    b442 - block
    b826 - block
    b252 - block
    b367 - block
    b649 - block
    b206 - block
    b3 - block
    b658 - block
    b765 - block
    b861 - block
    b914 - block
    b913 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b999 )
    ( on b531 b999 )
    ( on b442 b531 )
    ( on b826 b442 )
    ( on b252 b826 )
    ( on b367 b252 )
    ( on b649 b367 )
    ( on b206 b649 )
    ( on b3 b206 )
    ( on b658 b3 )
    ( on b765 b658 )
    ( on b861 b765 )
    ( on b914 b861 )
    ( on b913 b914 )
    ( clear b913 )
  )
  ( :goal
    ( and
      ( clear b999 )
    )
  )
)
