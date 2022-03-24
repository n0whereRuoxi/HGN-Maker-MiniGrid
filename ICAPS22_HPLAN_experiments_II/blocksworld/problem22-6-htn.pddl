( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b101 - block
    b653 - block
    b666 - block
    b173 - block
    b880 - block
    b472 - block
    b190 - block
    b151 - block
    b698 - block
    b149 - block
    b926 - block
    b39 - block
    b259 - block
    b823 - block
    b806 - block
    b66 - block
    b249 - block
    b333 - block
    b43 - block
    b912 - block
    b954 - block
    b557 - block
    b351 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b101 )
    ( on b653 b101 )
    ( on b666 b653 )
    ( on b173 b666 )
    ( on b880 b173 )
    ( on b472 b880 )
    ( on b190 b472 )
    ( on b151 b190 )
    ( on b698 b151 )
    ( on b149 b698 )
    ( on b926 b149 )
    ( on b39 b926 )
    ( on b259 b39 )
    ( on b823 b259 )
    ( on b806 b823 )
    ( on b66 b806 )
    ( on b249 b66 )
    ( on b333 b249 )
    ( on b43 b333 )
    ( on b912 b43 )
    ( on b954 b912 )
    ( on b557 b954 )
    ( on b351 b557 )
    ( clear b351 )
  )
  ( :tasks
    ( Make-22Pile b653 b666 b173 b880 b472 b190 b151 b698 b149 b926 b39 b259 b823 b806 b66 b249 b333 b43 b912 b954 b557 b351 )
  )
)
