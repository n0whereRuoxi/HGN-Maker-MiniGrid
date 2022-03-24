( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b151 - block
    b748 - block
    b140 - block
    b180 - block
    b251 - block
    b165 - block
    b583 - block
    b23 - block
    b212 - block
    b787 - block
    b966 - block
    b363 - block
    b796 - block
    b490 - block
    b390 - block
    b727 - block
    b684 - block
    b105 - block
    b223 - block
    b526 - block
    b230 - block
    b709 - block
    b557 - block
    b870 - block
    b289 - block
    b549 - block
    b456 - block
    b66 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b151 )
    ( on b748 b151 )
    ( on b140 b748 )
    ( on b180 b140 )
    ( on b251 b180 )
    ( on b165 b251 )
    ( on b583 b165 )
    ( on b23 b583 )
    ( on b212 b23 )
    ( on b787 b212 )
    ( on b966 b787 )
    ( on b363 b966 )
    ( on b796 b363 )
    ( on b490 b796 )
    ( on b390 b490 )
    ( on b727 b390 )
    ( on b684 b727 )
    ( on b105 b684 )
    ( on b223 b105 )
    ( on b526 b223 )
    ( on b230 b526 )
    ( on b709 b230 )
    ( on b557 b709 )
    ( on b870 b557 )
    ( on b289 b870 )
    ( on b549 b289 )
    ( on b456 b549 )
    ( on b66 b456 )
    ( clear b66 )
  )
  ( :tasks
    ( Make-27Pile b748 b140 b180 b251 b165 b583 b23 b212 b787 b966 b363 b796 b490 b390 b727 b684 b105 b223 b526 b230 b709 b557 b870 b289 b549 b456 b66 )
  )
)
