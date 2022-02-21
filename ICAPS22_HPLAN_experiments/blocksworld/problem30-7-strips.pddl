( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b863 - block
    b796 - block
    b984 - block
    b55 - block
    b954 - block
    b979 - block
    b437 - block
    b562 - block
    b742 - block
    b646 - block
    b565 - block
    b747 - block
    b233 - block
    b313 - block
    b919 - block
    b487 - block
    b690 - block
    b39 - block
    b168 - block
    b832 - block
    b657 - block
    b299 - block
    b537 - block
    b10 - block
    b461 - block
    b681 - block
    b704 - block
    b274 - block
    b397 - block
    b409 - block
    b987 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b863 )
    ( on b796 b863 )
    ( on b984 b796 )
    ( on b55 b984 )
    ( on b954 b55 )
    ( on b979 b954 )
    ( on b437 b979 )
    ( on b562 b437 )
    ( on b742 b562 )
    ( on b646 b742 )
    ( on b565 b646 )
    ( on b747 b565 )
    ( on b233 b747 )
    ( on b313 b233 )
    ( on b919 b313 )
    ( on b487 b919 )
    ( on b690 b487 )
    ( on b39 b690 )
    ( on b168 b39 )
    ( on b832 b168 )
    ( on b657 b832 )
    ( on b299 b657 )
    ( on b537 b299 )
    ( on b10 b537 )
    ( on b461 b10 )
    ( on b681 b461 )
    ( on b704 b681 )
    ( on b274 b704 )
    ( on b397 b274 )
    ( on b409 b397 )
    ( on b987 b409 )
    ( clear b987 )
  )
  ( :goal
    ( and
      ( clear b863 )
    )
  )
)
