( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b359 - block
    b564 - block
    b108 - block
    b522 - block
    b800 - block
    b980 - block
    b23 - block
    b575 - block
    b675 - block
    b393 - block
    b888 - block
    b641 - block
    b797 - block
    b461 - block
    b577 - block
    b2 - block
    b303 - block
    b683 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b359 )
    ( on b564 b359 )
    ( on b108 b564 )
    ( on b522 b108 )
    ( on b800 b522 )
    ( on b980 b800 )
    ( on b23 b980 )
    ( on b575 b23 )
    ( on b675 b575 )
    ( on b393 b675 )
    ( on b888 b393 )
    ( on b641 b888 )
    ( on b797 b641 )
    ( on b461 b797 )
    ( on b577 b461 )
    ( on b2 b577 )
    ( on b303 b2 )
    ( on b683 b303 )
    ( on b414 b683 )
    ( clear b414 )
  )
  ( :tasks
    ( Make-18Pile b564 b108 b522 b800 b980 b23 b575 b675 b393 b888 b641 b797 b461 b577 b2 b303 b683 b414 )
  )
)
