( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b652 - block
    b710 - block
    b267 - block
    b217 - block
    b729 - block
    b774 - block
    b481 - block
    b139 - block
    b266 - block
    b288 - block
    b931 - block
    b912 - block
    b695 - block
    b699 - block
    b914 - block
    b981 - block
    b681 - block
    b21 - block
    b181 - block
    b54 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b652 )
    ( on b710 b652 )
    ( on b267 b710 )
    ( on b217 b267 )
    ( on b729 b217 )
    ( on b774 b729 )
    ( on b481 b774 )
    ( on b139 b481 )
    ( on b266 b139 )
    ( on b288 b266 )
    ( on b931 b288 )
    ( on b912 b931 )
    ( on b695 b912 )
    ( on b699 b695 )
    ( on b914 b699 )
    ( on b981 b914 )
    ( on b681 b981 )
    ( on b21 b681 )
    ( on b181 b21 )
    ( on b54 b181 )
    ( clear b54 )
  )
  ( :goal
    ( and
      ( clear b652 )
    )
  )
)
