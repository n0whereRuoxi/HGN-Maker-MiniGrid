( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b612 - block
    b151 - block
    b803 - block
    b901 - block
    b6 - block
    b122 - block
    b427 - block
    b5 - block
    b277 - block
    b949 - block
    b583 - block
    b783 - block
    b89 - block
    b711 - block
    b654 - block
    b621 - block
    b282 - block
    b674 - block
    b665 - block
    b767 - block
    b121 - block
    b512 - block
    b911 - block
    b489 - block
    b32 - block
    b33 - block
    b150 - block
    b51 - block
    b80 - block
    b359 - block
    b297 - block
    b162 - block
    b132 - block
    b604 - block
    b229 - block
    b9 - block
    b584 - block
    b319 - block
    b246 - block
    b57 - block
    b257 - block
    b239 - block
    b62 - block
    b384 - block
    b854 - block
    b461 - block
    b365 - block
    b254 - block
    b370 - block
    b263 - block
    b559 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b612 )
    ( on b151 b612 )
    ( on b803 b151 )
    ( on b901 b803 )
    ( on b6 b901 )
    ( on b122 b6 )
    ( on b427 b122 )
    ( on b5 b427 )
    ( on b277 b5 )
    ( on b949 b277 )
    ( on b583 b949 )
    ( on b783 b583 )
    ( on b89 b783 )
    ( on b711 b89 )
    ( on b654 b711 )
    ( on b621 b654 )
    ( on b282 b621 )
    ( on b674 b282 )
    ( on b665 b674 )
    ( on b767 b665 )
    ( on b121 b767 )
    ( on b512 b121 )
    ( on b911 b512 )
    ( on b489 b911 )
    ( on b32 b489 )
    ( on b33 b32 )
    ( on b150 b33 )
    ( on b51 b150 )
    ( on b80 b51 )
    ( on b359 b80 )
    ( on b297 b359 )
    ( on b162 b297 )
    ( on b132 b162 )
    ( on b604 b132 )
    ( on b229 b604 )
    ( on b9 b229 )
    ( on b584 b9 )
    ( on b319 b584 )
    ( on b246 b319 )
    ( on b57 b246 )
    ( on b257 b57 )
    ( on b239 b257 )
    ( on b62 b239 )
    ( on b384 b62 )
    ( on b854 b384 )
    ( on b461 b854 )
    ( on b365 b461 )
    ( on b254 b365 )
    ( on b370 b254 )
    ( on b263 b370 )
    ( on b559 b263 )
    ( clear b559 )
  )
  ( :goal
    ( and
      ( clear b612 )
    )
  )
)
