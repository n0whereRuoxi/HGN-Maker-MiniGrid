( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b178 - block
    b3 - block
    b421 - block
    b711 - block
    b101 - block
    b741 - block
    b77 - block
    b22 - block
    b274 - block
    b921 - block
    b884 - block
    b786 - block
    b534 - block
    b903 - block
    b242 - block
    b485 - block
    b191 - block
    b184 - block
    b802 - block
    b154 - block
    b331 - block
    b248 - block
    b303 - block
    b668 - block
    b153 - block
    b327 - block
    b185 - block
    b62 - block
    b763 - block
    b880 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b178 )
    ( on b3 b178 )
    ( on b421 b3 )
    ( on b711 b421 )
    ( on b101 b711 )
    ( on b741 b101 )
    ( on b77 b741 )
    ( on b22 b77 )
    ( on b274 b22 )
    ( on b921 b274 )
    ( on b884 b921 )
    ( on b786 b884 )
    ( on b534 b786 )
    ( on b903 b534 )
    ( on b242 b903 )
    ( on b485 b242 )
    ( on b191 b485 )
    ( on b184 b191 )
    ( on b802 b184 )
    ( on b154 b802 )
    ( on b331 b154 )
    ( on b248 b331 )
    ( on b303 b248 )
    ( on b668 b303 )
    ( on b153 b668 )
    ( on b327 b153 )
    ( on b185 b327 )
    ( on b62 b185 )
    ( on b763 b62 )
    ( on b880 b763 )
    ( clear b880 )
  )
  ( :goal
    ( and
      ( clear b178 )
    )
  )
)
