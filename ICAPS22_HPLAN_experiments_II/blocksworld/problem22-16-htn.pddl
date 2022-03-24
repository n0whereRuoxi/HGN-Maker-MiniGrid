( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b323 - block
    b870 - block
    b248 - block
    b544 - block
    b271 - block
    b530 - block
    b567 - block
    b319 - block
    b833 - block
    b660 - block
    b154 - block
    b69 - block
    b755 - block
    b777 - block
    b721 - block
    b14 - block
    b457 - block
    b797 - block
    b441 - block
    b899 - block
    b714 - block
    b127 - block
    b95 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b323 )
    ( on b870 b323 )
    ( on b248 b870 )
    ( on b544 b248 )
    ( on b271 b544 )
    ( on b530 b271 )
    ( on b567 b530 )
    ( on b319 b567 )
    ( on b833 b319 )
    ( on b660 b833 )
    ( on b154 b660 )
    ( on b69 b154 )
    ( on b755 b69 )
    ( on b777 b755 )
    ( on b721 b777 )
    ( on b14 b721 )
    ( on b457 b14 )
    ( on b797 b457 )
    ( on b441 b797 )
    ( on b899 b441 )
    ( on b714 b899 )
    ( on b127 b714 )
    ( on b95 b127 )
    ( clear b95 )
  )
  ( :tasks
    ( Make-22Pile b870 b248 b544 b271 b530 b567 b319 b833 b660 b154 b69 b755 b777 b721 b14 b457 b797 b441 b899 b714 b127 b95 )
  )
)
