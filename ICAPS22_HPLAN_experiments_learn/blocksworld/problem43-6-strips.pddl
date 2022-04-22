( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b329 - block
    b881 - block
    b300 - block
    b417 - block
    b456 - block
    b490 - block
    b890 - block
    b469 - block
    b385 - block
    b619 - block
    b958 - block
    b242 - block
    b281 - block
    b649 - block
    b425 - block
    b537 - block
    b609 - block
    b695 - block
    b313 - block
    b704 - block
    b246 - block
    b25 - block
    b217 - block
    b610 - block
    b339 - block
    b918 - block
    b209 - block
    b861 - block
    b793 - block
    b258 - block
    b577 - block
    b145 - block
    b205 - block
    b717 - block
    b844 - block
    b806 - block
    b433 - block
    b187 - block
    b637 - block
    b207 - block
    b850 - block
    b668 - block
    b834 - block
    b208 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b329 )
    ( on b881 b329 )
    ( on b300 b881 )
    ( on b417 b300 )
    ( on b456 b417 )
    ( on b490 b456 )
    ( on b890 b490 )
    ( on b469 b890 )
    ( on b385 b469 )
    ( on b619 b385 )
    ( on b958 b619 )
    ( on b242 b958 )
    ( on b281 b242 )
    ( on b649 b281 )
    ( on b425 b649 )
    ( on b537 b425 )
    ( on b609 b537 )
    ( on b695 b609 )
    ( on b313 b695 )
    ( on b704 b313 )
    ( on b246 b704 )
    ( on b25 b246 )
    ( on b217 b25 )
    ( on b610 b217 )
    ( on b339 b610 )
    ( on b918 b339 )
    ( on b209 b918 )
    ( on b861 b209 )
    ( on b793 b861 )
    ( on b258 b793 )
    ( on b577 b258 )
    ( on b145 b577 )
    ( on b205 b145 )
    ( on b717 b205 )
    ( on b844 b717 )
    ( on b806 b844 )
    ( on b433 b806 )
    ( on b187 b433 )
    ( on b637 b187 )
    ( on b207 b637 )
    ( on b850 b207 )
    ( on b668 b850 )
    ( on b834 b668 )
    ( on b208 b834 )
    ( clear b208 )
  )
  ( :goal
    ( and
      ( clear b329 )
    )
  )
)
