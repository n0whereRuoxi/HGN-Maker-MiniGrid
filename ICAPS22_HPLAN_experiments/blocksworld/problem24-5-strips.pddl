( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b398 - block
    b437 - block
    b948 - block
    b894 - block
    b578 - block
    b14 - block
    b462 - block
    b661 - block
    b254 - block
    b757 - block
    b551 - block
    b609 - block
    b363 - block
    b719 - block
    b985 - block
    b116 - block
    b897 - block
    b759 - block
    b100 - block
    b598 - block
    b994 - block
    b733 - block
    b213 - block
    b916 - block
    b484 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b398 )
    ( on b437 b398 )
    ( on b948 b437 )
    ( on b894 b948 )
    ( on b578 b894 )
    ( on b14 b578 )
    ( on b462 b14 )
    ( on b661 b462 )
    ( on b254 b661 )
    ( on b757 b254 )
    ( on b551 b757 )
    ( on b609 b551 )
    ( on b363 b609 )
    ( on b719 b363 )
    ( on b985 b719 )
    ( on b116 b985 )
    ( on b897 b116 )
    ( on b759 b897 )
    ( on b100 b759 )
    ( on b598 b100 )
    ( on b994 b598 )
    ( on b733 b994 )
    ( on b213 b733 )
    ( on b916 b213 )
    ( on b484 b916 )
    ( clear b484 )
  )
  ( :goal
    ( and
      ( clear b398 )
    )
  )
)
