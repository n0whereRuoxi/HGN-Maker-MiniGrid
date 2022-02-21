( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b53 - block
    b648 - block
    b507 - block
    b781 - block
    b2 - block
    b575 - block
    b409 - block
    b336 - block
    b148 - block
    b4 - block
    b985 - block
    b19 - block
    b942 - block
    b845 - block
    b617 - block
    b550 - block
    b732 - block
    b527 - block
    b693 - block
    b952 - block
    b139 - block
    b740 - block
    b133 - block
    b26 - block
    b487 - block
    b123 - block
    b591 - block
    b723 - block
    b299 - block
    b632 - block
    b348 - block
    b270 - block
    b183 - block
    b486 - block
    b722 - block
    b810 - block
    b89 - block
    b529 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b53 )
    ( on b648 b53 )
    ( on b507 b648 )
    ( on b781 b507 )
    ( on b2 b781 )
    ( on b575 b2 )
    ( on b409 b575 )
    ( on b336 b409 )
    ( on b148 b336 )
    ( on b4 b148 )
    ( on b985 b4 )
    ( on b19 b985 )
    ( on b942 b19 )
    ( on b845 b942 )
    ( on b617 b845 )
    ( on b550 b617 )
    ( on b732 b550 )
    ( on b527 b732 )
    ( on b693 b527 )
    ( on b952 b693 )
    ( on b139 b952 )
    ( on b740 b139 )
    ( on b133 b740 )
    ( on b26 b133 )
    ( on b487 b26 )
    ( on b123 b487 )
    ( on b591 b123 )
    ( on b723 b591 )
    ( on b299 b723 )
    ( on b632 b299 )
    ( on b348 b632 )
    ( on b270 b348 )
    ( on b183 b270 )
    ( on b486 b183 )
    ( on b722 b486 )
    ( on b810 b722 )
    ( on b89 b810 )
    ( on b529 b89 )
    ( on b63 b529 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b53 )
    )
  )
)
