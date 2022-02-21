( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b983 - block
    b109 - block
    b802 - block
    b213 - block
    b342 - block
    b426 - block
    b177 - block
    b415 - block
    b566 - block
    b283 - block
    b630 - block
    b771 - block
    b835 - block
    b815 - block
    b626 - block
    b306 - block
    b80 - block
    b727 - block
    b211 - block
    b280 - block
    b992 - block
    b888 - block
    b535 - block
    b648 - block
    b860 - block
    b358 - block
    b90 - block
    b523 - block
    b687 - block
    b685 - block
    b20 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b983 )
    ( on b109 b983 )
    ( on b802 b109 )
    ( on b213 b802 )
    ( on b342 b213 )
    ( on b426 b342 )
    ( on b177 b426 )
    ( on b415 b177 )
    ( on b566 b415 )
    ( on b283 b566 )
    ( on b630 b283 )
    ( on b771 b630 )
    ( on b835 b771 )
    ( on b815 b835 )
    ( on b626 b815 )
    ( on b306 b626 )
    ( on b80 b306 )
    ( on b727 b80 )
    ( on b211 b727 )
    ( on b280 b211 )
    ( on b992 b280 )
    ( on b888 b992 )
    ( on b535 b888 )
    ( on b648 b535 )
    ( on b860 b648 )
    ( on b358 b860 )
    ( on b90 b358 )
    ( on b523 b90 )
    ( on b687 b523 )
    ( on b685 b687 )
    ( on b20 b685 )
    ( clear b20 )
  )
  ( :goal
    ( and
      ( clear b983 )
    )
  )
)
