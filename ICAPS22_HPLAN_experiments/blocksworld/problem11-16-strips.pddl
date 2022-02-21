( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b7 - block
    b170 - block
    b206 - block
    b977 - block
    b937 - block
    b495 - block
    b997 - block
    b823 - block
    b87 - block
    b138 - block
    b112 - block
    b836 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b7 )
    ( on b170 b7 )
    ( on b206 b170 )
    ( on b977 b206 )
    ( on b937 b977 )
    ( on b495 b937 )
    ( on b997 b495 )
    ( on b823 b997 )
    ( on b87 b823 )
    ( on b138 b87 )
    ( on b112 b138 )
    ( on b836 b112 )
    ( clear b836 )
  )
  ( :goal
    ( and
      ( clear b7 )
    )
  )
)
