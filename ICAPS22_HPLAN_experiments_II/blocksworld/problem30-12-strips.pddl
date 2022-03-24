( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b419 - block
    b201 - block
    b466 - block
    b11 - block
    b286 - block
    b469 - block
    b368 - block
    b535 - block
    b214 - block
    b767 - block
    b797 - block
    b958 - block
    b735 - block
    b548 - block
    b219 - block
    b407 - block
    b582 - block
    b144 - block
    b740 - block
    b588 - block
    b719 - block
    b873 - block
    b472 - block
    b687 - block
    b632 - block
    b703 - block
    b927 - block
    b492 - block
    b69 - block
    b21 - block
    b429 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b419 )
    ( on b201 b419 )
    ( on b466 b201 )
    ( on b11 b466 )
    ( on b286 b11 )
    ( on b469 b286 )
    ( on b368 b469 )
    ( on b535 b368 )
    ( on b214 b535 )
    ( on b767 b214 )
    ( on b797 b767 )
    ( on b958 b797 )
    ( on b735 b958 )
    ( on b548 b735 )
    ( on b219 b548 )
    ( on b407 b219 )
    ( on b582 b407 )
    ( on b144 b582 )
    ( on b740 b144 )
    ( on b588 b740 )
    ( on b719 b588 )
    ( on b873 b719 )
    ( on b472 b873 )
    ( on b687 b472 )
    ( on b632 b687 )
    ( on b703 b632 )
    ( on b927 b703 )
    ( on b492 b927 )
    ( on b69 b492 )
    ( on b21 b69 )
    ( on b429 b21 )
    ( clear b429 )
  )
  ( :goal
    ( and
      ( clear b419 )
    )
  )
)
