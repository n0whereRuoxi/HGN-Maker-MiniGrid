( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b989 - block
    b60 - block
    b859 - block
    b607 - block
    b576 - block
    b960 - block
    b518 - block
    b882 - block
    b944 - block
    b270 - block
    b148 - block
    b909 - block
    b492 - block
    b24 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b989 )
    ( on b60 b989 )
    ( on b859 b60 )
    ( on b607 b859 )
    ( on b576 b607 )
    ( on b960 b576 )
    ( on b518 b960 )
    ( on b882 b518 )
    ( on b944 b882 )
    ( on b270 b944 )
    ( on b148 b270 )
    ( on b909 b148 )
    ( on b492 b909 )
    ( on b24 b492 )
    ( on b716 b24 )
    ( clear b716 )
  )
  ( :goal
    ( and
      ( clear b989 )
    )
  )
)
