( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b273 - block
    b30 - block
    b989 - block
    b109 - block
    b61 - block
    b257 - block
    b76 - block
    b747 - block
    b743 - block
    b279 - block
    b595 - block
    b654 - block
    b700 - block
    b904 - block
    b634 - block
    b130 - block
    b7 - block
    b931 - block
    b572 - block
    b318 - block
    b504 - block
    b432 - block
    b610 - block
    b534 - block
    b861 - block
    b60 - block
    b605 - block
    b704 - block
    b732 - block
    b601 - block
    b578 - block
    b907 - block
    b421 - block
    b210 - block
    b397 - block
    b84 - block
    b107 - block
    b50 - block
    b712 - block
    b831 - block
    b272 - block
    b728 - block
    b805 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b273 )
    ( on b30 b273 )
    ( on b989 b30 )
    ( on b109 b989 )
    ( on b61 b109 )
    ( on b257 b61 )
    ( on b76 b257 )
    ( on b747 b76 )
    ( on b743 b747 )
    ( on b279 b743 )
    ( on b595 b279 )
    ( on b654 b595 )
    ( on b700 b654 )
    ( on b904 b700 )
    ( on b634 b904 )
    ( on b130 b634 )
    ( on b7 b130 )
    ( on b931 b7 )
    ( on b572 b931 )
    ( on b318 b572 )
    ( on b504 b318 )
    ( on b432 b504 )
    ( on b610 b432 )
    ( on b534 b610 )
    ( on b861 b534 )
    ( on b60 b861 )
    ( on b605 b60 )
    ( on b704 b605 )
    ( on b732 b704 )
    ( on b601 b732 )
    ( on b578 b601 )
    ( on b907 b578 )
    ( on b421 b907 )
    ( on b210 b421 )
    ( on b397 b210 )
    ( on b84 b397 )
    ( on b107 b84 )
    ( on b50 b107 )
    ( on b712 b50 )
    ( on b831 b712 )
    ( on b272 b831 )
    ( on b728 b272 )
    ( on b805 b728 )
    ( clear b805 )
  )
  ( :goal
    ( and
      ( clear b273 )
    )
  )
)
