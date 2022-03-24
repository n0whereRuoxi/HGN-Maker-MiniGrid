( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b59 - block
    b236 - block
    b339 - block
    b877 - block
    b860 - block
    b666 - block
    b870 - block
    b439 - block
    b538 - block
    b820 - block
    b170 - block
    b912 - block
    b990 - block
    b126 - block
    b239 - block
    b119 - block
    b580 - block
    b405 - block
    b958 - block
    b519 - block
    b343 - block
    b353 - block
    b811 - block
    b921 - block
    b488 - block
    b655 - block
    b302 - block
    b14 - block
    b246 - block
    b410 - block
    b911 - block
    b166 - block
    b627 - block
    b840 - block
    b852 - block
    b345 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b59 )
    ( on b236 b59 )
    ( on b339 b236 )
    ( on b877 b339 )
    ( on b860 b877 )
    ( on b666 b860 )
    ( on b870 b666 )
    ( on b439 b870 )
    ( on b538 b439 )
    ( on b820 b538 )
    ( on b170 b820 )
    ( on b912 b170 )
    ( on b990 b912 )
    ( on b126 b990 )
    ( on b239 b126 )
    ( on b119 b239 )
    ( on b580 b119 )
    ( on b405 b580 )
    ( on b958 b405 )
    ( on b519 b958 )
    ( on b343 b519 )
    ( on b353 b343 )
    ( on b811 b353 )
    ( on b921 b811 )
    ( on b488 b921 )
    ( on b655 b488 )
    ( on b302 b655 )
    ( on b14 b302 )
    ( on b246 b14 )
    ( on b410 b246 )
    ( on b911 b410 )
    ( on b166 b911 )
    ( on b627 b166 )
    ( on b840 b627 )
    ( on b852 b840 )
    ( on b345 b852 )
    ( clear b345 )
  )
  ( :goal
    ( and
      ( clear b59 )
    )
  )
)
