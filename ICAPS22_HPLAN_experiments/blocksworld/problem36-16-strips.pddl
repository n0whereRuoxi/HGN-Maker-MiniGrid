( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b579 - block
    b645 - block
    b764 - block
    b881 - block
    b69 - block
    b653 - block
    b861 - block
    b575 - block
    b141 - block
    b973 - block
    b728 - block
    b260 - block
    b530 - block
    b11 - block
    b63 - block
    b221 - block
    b304 - block
    b478 - block
    b154 - block
    b54 - block
    b504 - block
    b877 - block
    b834 - block
    b45 - block
    b711 - block
    b815 - block
    b362 - block
    b784 - block
    b206 - block
    b134 - block
    b427 - block
    b298 - block
    b548 - block
    b387 - block
    b710 - block
    b962 - block
    b609 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b579 )
    ( on b645 b579 )
    ( on b764 b645 )
    ( on b881 b764 )
    ( on b69 b881 )
    ( on b653 b69 )
    ( on b861 b653 )
    ( on b575 b861 )
    ( on b141 b575 )
    ( on b973 b141 )
    ( on b728 b973 )
    ( on b260 b728 )
    ( on b530 b260 )
    ( on b11 b530 )
    ( on b63 b11 )
    ( on b221 b63 )
    ( on b304 b221 )
    ( on b478 b304 )
    ( on b154 b478 )
    ( on b54 b154 )
    ( on b504 b54 )
    ( on b877 b504 )
    ( on b834 b877 )
    ( on b45 b834 )
    ( on b711 b45 )
    ( on b815 b711 )
    ( on b362 b815 )
    ( on b784 b362 )
    ( on b206 b784 )
    ( on b134 b206 )
    ( on b427 b134 )
    ( on b298 b427 )
    ( on b548 b298 )
    ( on b387 b548 )
    ( on b710 b387 )
    ( on b962 b710 )
    ( on b609 b962 )
    ( clear b609 )
  )
  ( :goal
    ( and
      ( clear b579 )
    )
  )
)
