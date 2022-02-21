( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b281 - block
    b510 - block
    b27 - block
    b810 - block
    b470 - block
    b622 - block
    b475 - block
    b49 - block
    b887 - block
    b306 - block
    b713 - block
    b523 - block
    b535 - block
    b655 - block
    b161 - block
    b411 - block
    b550 - block
    b260 - block
    b994 - block
    b711 - block
    b213 - block
    b13 - block
    b288 - block
    b318 - block
    b602 - block
    b860 - block
    b151 - block
    b973 - block
    b679 - block
    b570 - block
    b476 - block
    b325 - block
    b379 - block
    b338 - block
    b989 - block
    b667 - block
    b97 - block
    b478 - block
    b3 - block
    b915 - block
    b631 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b281 )
    ( on b510 b281 )
    ( on b27 b510 )
    ( on b810 b27 )
    ( on b470 b810 )
    ( on b622 b470 )
    ( on b475 b622 )
    ( on b49 b475 )
    ( on b887 b49 )
    ( on b306 b887 )
    ( on b713 b306 )
    ( on b523 b713 )
    ( on b535 b523 )
    ( on b655 b535 )
    ( on b161 b655 )
    ( on b411 b161 )
    ( on b550 b411 )
    ( on b260 b550 )
    ( on b994 b260 )
    ( on b711 b994 )
    ( on b213 b711 )
    ( on b13 b213 )
    ( on b288 b13 )
    ( on b318 b288 )
    ( on b602 b318 )
    ( on b860 b602 )
    ( on b151 b860 )
    ( on b973 b151 )
    ( on b679 b973 )
    ( on b570 b679 )
    ( on b476 b570 )
    ( on b325 b476 )
    ( on b379 b325 )
    ( on b338 b379 )
    ( on b989 b338 )
    ( on b667 b989 )
    ( on b97 b667 )
    ( on b478 b97 )
    ( on b3 b478 )
    ( on b915 b3 )
    ( on b631 b915 )
    ( clear b631 )
  )
  ( :goal
    ( and
      ( clear b281 )
    )
  )
)
