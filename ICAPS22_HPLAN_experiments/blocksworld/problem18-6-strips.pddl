( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b989 - block
    b155 - block
    b958 - block
    b611 - block
    b794 - block
    b12 - block
    b419 - block
    b768 - block
    b846 - block
    b157 - block
    b935 - block
    b972 - block
    b664 - block
    b272 - block
    b647 - block
    b151 - block
    b919 - block
    b320 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b989 )
    ( on b155 b989 )
    ( on b958 b155 )
    ( on b611 b958 )
    ( on b794 b611 )
    ( on b12 b794 )
    ( on b419 b12 )
    ( on b768 b419 )
    ( on b846 b768 )
    ( on b157 b846 )
    ( on b935 b157 )
    ( on b972 b935 )
    ( on b664 b972 )
    ( on b272 b664 )
    ( on b647 b272 )
    ( on b151 b647 )
    ( on b919 b151 )
    ( on b320 b919 )
    ( on b63 b320 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b989 )
    )
  )
)
