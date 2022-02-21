( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b279 - block
    b182 - block
    b679 - block
    b855 - block
    b989 - block
    b862 - block
    b409 - block
    b339 - block
    b692 - block
    b11 - block
    b918 - block
    b948 - block
    b768 - block
    b992 - block
    b695 - block
    b480 - block
    b134 - block
    b490 - block
    b435 - block
    b683 - block
    b129 - block
    b27 - block
    b408 - block
    b907 - block
    b489 - block
    b760 - block
    b385 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b279 )
    ( on b182 b279 )
    ( on b679 b182 )
    ( on b855 b679 )
    ( on b989 b855 )
    ( on b862 b989 )
    ( on b409 b862 )
    ( on b339 b409 )
    ( on b692 b339 )
    ( on b11 b692 )
    ( on b918 b11 )
    ( on b948 b918 )
    ( on b768 b948 )
    ( on b992 b768 )
    ( on b695 b992 )
    ( on b480 b695 )
    ( on b134 b480 )
    ( on b490 b134 )
    ( on b435 b490 )
    ( on b683 b435 )
    ( on b129 b683 )
    ( on b27 b129 )
    ( on b408 b27 )
    ( on b907 b408 )
    ( on b489 b907 )
    ( on b760 b489 )
    ( on b385 b760 )
    ( clear b385 )
  )
  ( :goal
    ( and
      ( clear b279 )
    )
  )
)
