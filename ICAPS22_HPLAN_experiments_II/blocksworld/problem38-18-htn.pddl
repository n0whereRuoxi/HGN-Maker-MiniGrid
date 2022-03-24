( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b777 - block
    b936 - block
    b874 - block
    b122 - block
    b472 - block
    b345 - block
    b103 - block
    b749 - block
    b195 - block
    b110 - block
    b89 - block
    b290 - block
    b283 - block
    b120 - block
    b898 - block
    b326 - block
    b692 - block
    b955 - block
    b698 - block
    b522 - block
    b370 - block
    b474 - block
    b344 - block
    b755 - block
    b743 - block
    b16 - block
    b440 - block
    b121 - block
    b76 - block
    b512 - block
    b908 - block
    b982 - block
    b148 - block
    b947 - block
    b392 - block
    b571 - block
    b991 - block
    b546 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b777 )
    ( on b936 b777 )
    ( on b874 b936 )
    ( on b122 b874 )
    ( on b472 b122 )
    ( on b345 b472 )
    ( on b103 b345 )
    ( on b749 b103 )
    ( on b195 b749 )
    ( on b110 b195 )
    ( on b89 b110 )
    ( on b290 b89 )
    ( on b283 b290 )
    ( on b120 b283 )
    ( on b898 b120 )
    ( on b326 b898 )
    ( on b692 b326 )
    ( on b955 b692 )
    ( on b698 b955 )
    ( on b522 b698 )
    ( on b370 b522 )
    ( on b474 b370 )
    ( on b344 b474 )
    ( on b755 b344 )
    ( on b743 b755 )
    ( on b16 b743 )
    ( on b440 b16 )
    ( on b121 b440 )
    ( on b76 b121 )
    ( on b512 b76 )
    ( on b908 b512 )
    ( on b982 b908 )
    ( on b148 b982 )
    ( on b947 b148 )
    ( on b392 b947 )
    ( on b571 b392 )
    ( on b991 b571 )
    ( on b546 b991 )
    ( on b731 b546 )
    ( clear b731 )
  )
  ( :tasks
    ( Make-38Pile b936 b874 b122 b472 b345 b103 b749 b195 b110 b89 b290 b283 b120 b898 b326 b692 b955 b698 b522 b370 b474 b344 b755 b743 b16 b440 b121 b76 b512 b908 b982 b148 b947 b392 b571 b991 b546 b731 )
  )
)
