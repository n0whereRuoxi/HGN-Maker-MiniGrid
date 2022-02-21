( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b990 - block
    b942 - block
    b100 - block
    b899 - block
    b533 - block
    b681 - block
    b437 - block
    b870 - block
    b138 - block
    b710 - block
    b622 - block
    b324 - block
    b122 - block
    b522 - block
    b445 - block
    b397 - block
    b919 - block
    b951 - block
    b1 - block
    b390 - block
    b903 - block
    b150 - block
    b241 - block
    b508 - block
    b953 - block
    b53 - block
    b64 - block
    b431 - block
    b834 - block
    b316 - block
    b505 - block
    b470 - block
    b771 - block
    b432 - block
    b160 - block
    b595 - block
    b213 - block
    b721 - block
    b543 - block
    b398 - block
    b302 - block
    b758 - block
    b211 - block
    b805 - block
    b198 - block
    b293 - block
    b82 - block
    b20 - block
    b177 - block
    b411 - block
    b769 - block
    b208 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b990 )
    ( on b942 b990 )
    ( on b100 b942 )
    ( on b899 b100 )
    ( on b533 b899 )
    ( on b681 b533 )
    ( on b437 b681 )
    ( on b870 b437 )
    ( on b138 b870 )
    ( on b710 b138 )
    ( on b622 b710 )
    ( on b324 b622 )
    ( on b122 b324 )
    ( on b522 b122 )
    ( on b445 b522 )
    ( on b397 b445 )
    ( on b919 b397 )
    ( on b951 b919 )
    ( on b1 b951 )
    ( on b390 b1 )
    ( on b903 b390 )
    ( on b150 b903 )
    ( on b241 b150 )
    ( on b508 b241 )
    ( on b953 b508 )
    ( on b53 b953 )
    ( on b64 b53 )
    ( on b431 b64 )
    ( on b834 b431 )
    ( on b316 b834 )
    ( on b505 b316 )
    ( on b470 b505 )
    ( on b771 b470 )
    ( on b432 b771 )
    ( on b160 b432 )
    ( on b595 b160 )
    ( on b213 b595 )
    ( on b721 b213 )
    ( on b543 b721 )
    ( on b398 b543 )
    ( on b302 b398 )
    ( on b758 b302 )
    ( on b211 b758 )
    ( on b805 b211 )
    ( on b198 b805 )
    ( on b293 b198 )
    ( on b82 b293 )
    ( on b20 b82 )
    ( on b177 b20 )
    ( on b411 b177 )
    ( on b769 b411 )
    ( on b208 b769 )
    ( clear b208 )
  )
  ( :goal
    ( and
      ( clear b990 )
    )
  )
)
