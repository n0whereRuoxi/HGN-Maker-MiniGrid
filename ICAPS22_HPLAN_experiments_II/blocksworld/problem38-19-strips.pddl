( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b985 - block
    b945 - block
    b890 - block
    b137 - block
    b980 - block
    b300 - block
    b892 - block
    b1 - block
    b683 - block
    b854 - block
    b523 - block
    b158 - block
    b472 - block
    b407 - block
    b636 - block
    b206 - block
    b451 - block
    b295 - block
    b889 - block
    b31 - block
    b397 - block
    b599 - block
    b619 - block
    b550 - block
    b41 - block
    b356 - block
    b205 - block
    b54 - block
    b247 - block
    b708 - block
    b148 - block
    b725 - block
    b977 - block
    b250 - block
    b216 - block
    b401 - block
    b981 - block
    b827 - block
    b622 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b985 )
    ( on b945 b985 )
    ( on b890 b945 )
    ( on b137 b890 )
    ( on b980 b137 )
    ( on b300 b980 )
    ( on b892 b300 )
    ( on b1 b892 )
    ( on b683 b1 )
    ( on b854 b683 )
    ( on b523 b854 )
    ( on b158 b523 )
    ( on b472 b158 )
    ( on b407 b472 )
    ( on b636 b407 )
    ( on b206 b636 )
    ( on b451 b206 )
    ( on b295 b451 )
    ( on b889 b295 )
    ( on b31 b889 )
    ( on b397 b31 )
    ( on b599 b397 )
    ( on b619 b599 )
    ( on b550 b619 )
    ( on b41 b550 )
    ( on b356 b41 )
    ( on b205 b356 )
    ( on b54 b205 )
    ( on b247 b54 )
    ( on b708 b247 )
    ( on b148 b708 )
    ( on b725 b148 )
    ( on b977 b725 )
    ( on b250 b977 )
    ( on b216 b250 )
    ( on b401 b216 )
    ( on b981 b401 )
    ( on b827 b981 )
    ( on b622 b827 )
    ( clear b622 )
  )
  ( :goal
    ( and
      ( clear b985 )
    )
  )
)
