( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b507 - block
    b185 - block
    b109 - block
    b443 - block
    b729 - block
    b336 - block
    b349 - block
    b175 - block
    b985 - block
    b601 - block
    b322 - block
    b706 - block
    b629 - block
    b379 - block
    b219 - block
    b287 - block
    b271 - block
    b647 - block
    b156 - block
    b86 - block
    b929 - block
    b895 - block
    b800 - block
    b533 - block
    b235 - block
    b604 - block
    b226 - block
    b757 - block
    b799 - block
    b122 - block
    b512 - block
    b717 - block
    b458 - block
    b848 - block
    b763 - block
    b244 - block
    b571 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b507 )
    ( on b185 b507 )
    ( on b109 b185 )
    ( on b443 b109 )
    ( on b729 b443 )
    ( on b336 b729 )
    ( on b349 b336 )
    ( on b175 b349 )
    ( on b985 b175 )
    ( on b601 b985 )
    ( on b322 b601 )
    ( on b706 b322 )
    ( on b629 b706 )
    ( on b379 b629 )
    ( on b219 b379 )
    ( on b287 b219 )
    ( on b271 b287 )
    ( on b647 b271 )
    ( on b156 b647 )
    ( on b86 b156 )
    ( on b929 b86 )
    ( on b895 b929 )
    ( on b800 b895 )
    ( on b533 b800 )
    ( on b235 b533 )
    ( on b604 b235 )
    ( on b226 b604 )
    ( on b757 b226 )
    ( on b799 b757 )
    ( on b122 b799 )
    ( on b512 b122 )
    ( on b717 b512 )
    ( on b458 b717 )
    ( on b848 b458 )
    ( on b763 b848 )
    ( on b244 b763 )
    ( on b571 b244 )
    ( clear b571 )
  )
  ( :goal
    ( and
      ( clear b507 )
    )
  )
)
