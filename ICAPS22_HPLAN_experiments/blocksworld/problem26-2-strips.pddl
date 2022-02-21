( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b859 - block
    b521 - block
    b397 - block
    b339 - block
    b581 - block
    b874 - block
    b801 - block
    b585 - block
    b996 - block
    b748 - block
    b912 - block
    b164 - block
    b946 - block
    b671 - block
    b936 - block
    b319 - block
    b607 - block
    b328 - block
    b209 - block
    b753 - block
    b399 - block
    b563 - block
    b345 - block
    b126 - block
    b773 - block
    b402 - block
    b785 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b859 )
    ( on b521 b859 )
    ( on b397 b521 )
    ( on b339 b397 )
    ( on b581 b339 )
    ( on b874 b581 )
    ( on b801 b874 )
    ( on b585 b801 )
    ( on b996 b585 )
    ( on b748 b996 )
    ( on b912 b748 )
    ( on b164 b912 )
    ( on b946 b164 )
    ( on b671 b946 )
    ( on b936 b671 )
    ( on b319 b936 )
    ( on b607 b319 )
    ( on b328 b607 )
    ( on b209 b328 )
    ( on b753 b209 )
    ( on b399 b753 )
    ( on b563 b399 )
    ( on b345 b563 )
    ( on b126 b345 )
    ( on b773 b126 )
    ( on b402 b773 )
    ( on b785 b402 )
    ( clear b785 )
  )
  ( :goal
    ( and
      ( clear b859 )
    )
  )
)
