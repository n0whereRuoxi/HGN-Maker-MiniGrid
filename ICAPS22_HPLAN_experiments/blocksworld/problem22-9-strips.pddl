( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b217 - block
    b435 - block
    b184 - block
    b884 - block
    b461 - block
    b733 - block
    b409 - block
    b886 - block
    b967 - block
    b716 - block
    b340 - block
    b86 - block
    b726 - block
    b839 - block
    b793 - block
    b788 - block
    b254 - block
    b988 - block
    b223 - block
    b19 - block
    b845 - block
    b354 - block
    b894 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b217 )
    ( on b435 b217 )
    ( on b184 b435 )
    ( on b884 b184 )
    ( on b461 b884 )
    ( on b733 b461 )
    ( on b409 b733 )
    ( on b886 b409 )
    ( on b967 b886 )
    ( on b716 b967 )
    ( on b340 b716 )
    ( on b86 b340 )
    ( on b726 b86 )
    ( on b839 b726 )
    ( on b793 b839 )
    ( on b788 b793 )
    ( on b254 b788 )
    ( on b988 b254 )
    ( on b223 b988 )
    ( on b19 b223 )
    ( on b845 b19 )
    ( on b354 b845 )
    ( on b894 b354 )
    ( clear b894 )
  )
  ( :goal
    ( and
      ( clear b217 )
    )
  )
)
