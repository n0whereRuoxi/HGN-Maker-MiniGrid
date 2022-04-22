( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b639 - block
    b191 - block
    b375 - block
    b416 - block
    b107 - block
    b274 - block
    b590 - block
    b467 - block
    b157 - block
    b669 - block
    b307 - block
    b708 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b639 )
    ( on b191 b639 )
    ( on b375 b191 )
    ( on b416 b375 )
    ( on b107 b416 )
    ( on b274 b107 )
    ( on b590 b274 )
    ( on b467 b590 )
    ( on b157 b467 )
    ( on b669 b157 )
    ( on b307 b669 )
    ( on b708 b307 )
    ( clear b708 )
  )
  ( :goal
    ( and
      ( clear b639 )
    )
  )
)
