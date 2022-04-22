( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b662 - block
    b633 - block
    b85 - block
    b930 - block
    b428 - block
    b109 - block
    b999 - block
    b852 - block
    b129 - block
    b744 - block
    b812 - block
    b817 - block
    b52 - block
    b74 - block
    b758 - block
    b444 - block
    b282 - block
    b7 - block
    b866 - block
    b5 - block
    b969 - block
    b848 - block
    b361 - block
    b643 - block
    b569 - block
    b512 - block
    b316 - block
    b322 - block
    b454 - block
    b877 - block
    b461 - block
    b682 - block
    b3 - block
    b869 - block
    b746 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b662 )
    ( on b633 b662 )
    ( on b85 b633 )
    ( on b930 b85 )
    ( on b428 b930 )
    ( on b109 b428 )
    ( on b999 b109 )
    ( on b852 b999 )
    ( on b129 b852 )
    ( on b744 b129 )
    ( on b812 b744 )
    ( on b817 b812 )
    ( on b52 b817 )
    ( on b74 b52 )
    ( on b758 b74 )
    ( on b444 b758 )
    ( on b282 b444 )
    ( on b7 b282 )
    ( on b866 b7 )
    ( on b5 b866 )
    ( on b969 b5 )
    ( on b848 b969 )
    ( on b361 b848 )
    ( on b643 b361 )
    ( on b569 b643 )
    ( on b512 b569 )
    ( on b316 b512 )
    ( on b322 b316 )
    ( on b454 b322 )
    ( on b877 b454 )
    ( on b461 b877 )
    ( on b682 b461 )
    ( on b3 b682 )
    ( on b869 b3 )
    ( on b746 b869 )
    ( on b667 b746 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b662 )
    )
  )
)
