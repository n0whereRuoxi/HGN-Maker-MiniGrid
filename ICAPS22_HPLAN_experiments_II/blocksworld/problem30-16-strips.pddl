( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b96 - block
    b261 - block
    b242 - block
    b233 - block
    b119 - block
    b854 - block
    b989 - block
    b237 - block
    b679 - block
    b897 - block
    b215 - block
    b166 - block
    b326 - block
    b901 - block
    b765 - block
    b351 - block
    b44 - block
    b834 - block
    b545 - block
    b687 - block
    b808 - block
    b890 - block
    b114 - block
    b683 - block
    b820 - block
    b49 - block
    b306 - block
    b888 - block
    b912 - block
    b243 - block
    b120 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b96 )
    ( on b261 b96 )
    ( on b242 b261 )
    ( on b233 b242 )
    ( on b119 b233 )
    ( on b854 b119 )
    ( on b989 b854 )
    ( on b237 b989 )
    ( on b679 b237 )
    ( on b897 b679 )
    ( on b215 b897 )
    ( on b166 b215 )
    ( on b326 b166 )
    ( on b901 b326 )
    ( on b765 b901 )
    ( on b351 b765 )
    ( on b44 b351 )
    ( on b834 b44 )
    ( on b545 b834 )
    ( on b687 b545 )
    ( on b808 b687 )
    ( on b890 b808 )
    ( on b114 b890 )
    ( on b683 b114 )
    ( on b820 b683 )
    ( on b49 b820 )
    ( on b306 b49 )
    ( on b888 b306 )
    ( on b912 b888 )
    ( on b243 b912 )
    ( on b120 b243 )
    ( clear b120 )
  )
  ( :goal
    ( and
      ( clear b96 )
    )
  )
)
