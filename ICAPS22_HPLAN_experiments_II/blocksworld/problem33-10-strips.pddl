( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b634 - block
    b742 - block
    b415 - block
    b832 - block
    b711 - block
    b606 - block
    b536 - block
    b484 - block
    b906 - block
    b241 - block
    b402 - block
    b830 - block
    b522 - block
    b299 - block
    b725 - block
    b278 - block
    b712 - block
    b781 - block
    b246 - block
    b920 - block
    b473 - block
    b646 - block
    b722 - block
    b274 - block
    b956 - block
    b311 - block
    b753 - block
    b986 - block
    b643 - block
    b103 - block
    b224 - block
    b166 - block
    b999 - block
    b307 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b634 )
    ( on b742 b634 )
    ( on b415 b742 )
    ( on b832 b415 )
    ( on b711 b832 )
    ( on b606 b711 )
    ( on b536 b606 )
    ( on b484 b536 )
    ( on b906 b484 )
    ( on b241 b906 )
    ( on b402 b241 )
    ( on b830 b402 )
    ( on b522 b830 )
    ( on b299 b522 )
    ( on b725 b299 )
    ( on b278 b725 )
    ( on b712 b278 )
    ( on b781 b712 )
    ( on b246 b781 )
    ( on b920 b246 )
    ( on b473 b920 )
    ( on b646 b473 )
    ( on b722 b646 )
    ( on b274 b722 )
    ( on b956 b274 )
    ( on b311 b956 )
    ( on b753 b311 )
    ( on b986 b753 )
    ( on b643 b986 )
    ( on b103 b643 )
    ( on b224 b103 )
    ( on b166 b224 )
    ( on b999 b166 )
    ( on b307 b999 )
    ( clear b307 )
  )
  ( :goal
    ( and
      ( clear b634 )
    )
  )
)
