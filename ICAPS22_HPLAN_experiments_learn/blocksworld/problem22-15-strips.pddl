( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b824 - block
    b580 - block
    b531 - block
    b481 - block
    b753 - block
    b538 - block
    b535 - block
    b172 - block
    b280 - block
    b219 - block
    b839 - block
    b526 - block
    b227 - block
    b471 - block
    b961 - block
    b802 - block
    b394 - block
    b474 - block
    b703 - block
    b934 - block
    b450 - block
    b736 - block
    b346 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b824 )
    ( on b580 b824 )
    ( on b531 b580 )
    ( on b481 b531 )
    ( on b753 b481 )
    ( on b538 b753 )
    ( on b535 b538 )
    ( on b172 b535 )
    ( on b280 b172 )
    ( on b219 b280 )
    ( on b839 b219 )
    ( on b526 b839 )
    ( on b227 b526 )
    ( on b471 b227 )
    ( on b961 b471 )
    ( on b802 b961 )
    ( on b394 b802 )
    ( on b474 b394 )
    ( on b703 b474 )
    ( on b934 b703 )
    ( on b450 b934 )
    ( on b736 b450 )
    ( on b346 b736 )
    ( clear b346 )
  )
  ( :goal
    ( and
      ( clear b824 )
    )
  )
)
