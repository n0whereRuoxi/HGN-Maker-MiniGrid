( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b738 - block
    b466 - block
    b318 - block
    b394 - block
    b608 - block
    b257 - block
    b430 - block
    b601 - block
    b28 - block
    b297 - block
    b444 - block
    b510 - block
    b905 - block
    b633 - block
    b446 - block
    b166 - block
    b439 - block
    b942 - block
    b168 - block
    b561 - block
    b417 - block
    b317 - block
    b323 - block
    b423 - block
    b861 - block
    b392 - block
    b426 - block
    b328 - block
    b102 - block
    b462 - block
    b316 - block
    b64 - block
    b69 - block
    b725 - block
    b70 - block
    b563 - block
    b884 - block
    b56 - block
    b585 - block
    b796 - block
    b819 - block
    b364 - block
    b120 - block
    b854 - block
    b655 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b738 )
    ( on b466 b738 )
    ( on b318 b466 )
    ( on b394 b318 )
    ( on b608 b394 )
    ( on b257 b608 )
    ( on b430 b257 )
    ( on b601 b430 )
    ( on b28 b601 )
    ( on b297 b28 )
    ( on b444 b297 )
    ( on b510 b444 )
    ( on b905 b510 )
    ( on b633 b905 )
    ( on b446 b633 )
    ( on b166 b446 )
    ( on b439 b166 )
    ( on b942 b439 )
    ( on b168 b942 )
    ( on b561 b168 )
    ( on b417 b561 )
    ( on b317 b417 )
    ( on b323 b317 )
    ( on b423 b323 )
    ( on b861 b423 )
    ( on b392 b861 )
    ( on b426 b392 )
    ( on b328 b426 )
    ( on b102 b328 )
    ( on b462 b102 )
    ( on b316 b462 )
    ( on b64 b316 )
    ( on b69 b64 )
    ( on b725 b69 )
    ( on b70 b725 )
    ( on b563 b70 )
    ( on b884 b563 )
    ( on b56 b884 )
    ( on b585 b56 )
    ( on b796 b585 )
    ( on b819 b796 )
    ( on b364 b819 )
    ( on b120 b364 )
    ( on b854 b120 )
    ( on b655 b854 )
    ( clear b655 )
  )
  ( :goal
    ( and
      ( clear b738 )
    )
  )
)
