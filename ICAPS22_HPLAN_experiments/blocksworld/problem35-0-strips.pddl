( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b591 - block
    b98 - block
    b297 - block
    b942 - block
    b965 - block
    b316 - block
    b964 - block
    b24 - block
    b584 - block
    b662 - block
    b953 - block
    b251 - block
    b549 - block
    b955 - block
    b224 - block
    b44 - block
    b880 - block
    b63 - block
    b431 - block
    b22 - block
    b757 - block
    b554 - block
    b275 - block
    b152 - block
    b523 - block
    b452 - block
    b73 - block
    b338 - block
    b984 - block
    b646 - block
    b711 - block
    b659 - block
    b801 - block
    b597 - block
    b707 - block
    b573 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b591 )
    ( on b98 b591 )
    ( on b297 b98 )
    ( on b942 b297 )
    ( on b965 b942 )
    ( on b316 b965 )
    ( on b964 b316 )
    ( on b24 b964 )
    ( on b584 b24 )
    ( on b662 b584 )
    ( on b953 b662 )
    ( on b251 b953 )
    ( on b549 b251 )
    ( on b955 b549 )
    ( on b224 b955 )
    ( on b44 b224 )
    ( on b880 b44 )
    ( on b63 b880 )
    ( on b431 b63 )
    ( on b22 b431 )
    ( on b757 b22 )
    ( on b554 b757 )
    ( on b275 b554 )
    ( on b152 b275 )
    ( on b523 b152 )
    ( on b452 b523 )
    ( on b73 b452 )
    ( on b338 b73 )
    ( on b984 b338 )
    ( on b646 b984 )
    ( on b711 b646 )
    ( on b659 b711 )
    ( on b801 b659 )
    ( on b597 b801 )
    ( on b707 b597 )
    ( on b573 b707 )
    ( clear b573 )
  )
  ( :goal
    ( and
      ( clear b591 )
    )
  )
)
