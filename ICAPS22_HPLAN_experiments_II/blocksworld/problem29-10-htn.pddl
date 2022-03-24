( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b662 - block
    b950 - block
    b876 - block
    b550 - block
    b528 - block
    b215 - block
    b421 - block
    b220 - block
    b854 - block
    b456 - block
    b161 - block
    b571 - block
    b449 - block
    b798 - block
    b921 - block
    b219 - block
    b493 - block
    b117 - block
    b207 - block
    b841 - block
    b523 - block
    b232 - block
    b275 - block
    b775 - block
    b227 - block
    b799 - block
    b858 - block
    b497 - block
    b248 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b662 b203 )
    ( on b950 b662 )
    ( on b876 b950 )
    ( on b550 b876 )
    ( on b528 b550 )
    ( on b215 b528 )
    ( on b421 b215 )
    ( on b220 b421 )
    ( on b854 b220 )
    ( on b456 b854 )
    ( on b161 b456 )
    ( on b571 b161 )
    ( on b449 b571 )
    ( on b798 b449 )
    ( on b921 b798 )
    ( on b219 b921 )
    ( on b493 b219 )
    ( on b117 b493 )
    ( on b207 b117 )
    ( on b841 b207 )
    ( on b523 b841 )
    ( on b232 b523 )
    ( on b275 b232 )
    ( on b775 b275 )
    ( on b227 b775 )
    ( on b799 b227 )
    ( on b858 b799 )
    ( on b497 b858 )
    ( on b248 b497 )
    ( clear b248 )
  )
  ( :tasks
    ( Make-29Pile b662 b950 b876 b550 b528 b215 b421 b220 b854 b456 b161 b571 b449 b798 b921 b219 b493 b117 b207 b841 b523 b232 b275 b775 b227 b799 b858 b497 b248 )
  )
)
