( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b530 - block
    b444 - block
    b209 - block
    b366 - block
    b423 - block
    b857 - block
    b452 - block
    b568 - block
    b848 - block
    b806 - block
    b885 - block
    b441 - block
    b80 - block
    b377 - block
    b65 - block
    b861 - block
    b443 - block
    b708 - block
    b838 - block
    b162 - block
    b300 - block
    b731 - block
    b880 - block
    b529 - block
    b148 - block
    b487 - block
    b992 - block
    b964 - block
    b158 - block
    b462 - block
    b382 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b530 )
    ( on b444 b530 )
    ( on b209 b444 )
    ( on b366 b209 )
    ( on b423 b366 )
    ( on b857 b423 )
    ( on b452 b857 )
    ( on b568 b452 )
    ( on b848 b568 )
    ( on b806 b848 )
    ( on b885 b806 )
    ( on b441 b885 )
    ( on b80 b441 )
    ( on b377 b80 )
    ( on b65 b377 )
    ( on b861 b65 )
    ( on b443 b861 )
    ( on b708 b443 )
    ( on b838 b708 )
    ( on b162 b838 )
    ( on b300 b162 )
    ( on b731 b300 )
    ( on b880 b731 )
    ( on b529 b880 )
    ( on b148 b529 )
    ( on b487 b148 )
    ( on b992 b487 )
    ( on b964 b992 )
    ( on b158 b964 )
    ( on b462 b158 )
    ( on b382 b462 )
    ( clear b382 )
  )
  ( :goal
    ( and
      ( clear b530 )
    )
  )
)
