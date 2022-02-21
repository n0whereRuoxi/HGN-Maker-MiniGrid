( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b457 - block
    b984 - block
    b415 - block
    b227 - block
    b613 - block
    b973 - block
    b337 - block
    b668 - block
    b2 - block
    b536 - block
    b397 - block
    b715 - block
    b533 - block
    b586 - block
    b346 - block
    b203 - block
    b634 - block
    b810 - block
    b588 - block
    b628 - block
    b137 - block
    b667 - block
    b711 - block
    b723 - block
    b286 - block
    b614 - block
    b511 - block
    b73 - block
    b825 - block
    b531 - block
    b903 - block
    b674 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b457 )
    ( on b984 b457 )
    ( on b415 b984 )
    ( on b227 b415 )
    ( on b613 b227 )
    ( on b973 b613 )
    ( on b337 b973 )
    ( on b668 b337 )
    ( on b2 b668 )
    ( on b536 b2 )
    ( on b397 b536 )
    ( on b715 b397 )
    ( on b533 b715 )
    ( on b586 b533 )
    ( on b346 b586 )
    ( on b203 b346 )
    ( on b634 b203 )
    ( on b810 b634 )
    ( on b588 b810 )
    ( on b628 b588 )
    ( on b137 b628 )
    ( on b667 b137 )
    ( on b711 b667 )
    ( on b723 b711 )
    ( on b286 b723 )
    ( on b614 b286 )
    ( on b511 b614 )
    ( on b73 b511 )
    ( on b825 b73 )
    ( on b531 b825 )
    ( on b903 b531 )
    ( on b674 b903 )
    ( clear b674 )
  )
  ( :goal
    ( and
      ( clear b457 )
    )
  )
)
