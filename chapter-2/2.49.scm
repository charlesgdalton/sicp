;;exercise 2.49-WIP

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame)
	 (start-segment segment))
	((frame-coord-map frame)
	 (end-segment segment))))
     segment-list)))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (frame-origin frame)
  (car frame))
(define (frame-edge1 frame)
  (cadr frame))
(define (frame-edge2 frame)
  (cddr frame))

(define (make-vect x y)
  (list x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cadr v))


(define (manipulate-vect f)
  (lambda (v1 v2)
    (make-vect
     (f (xcor-vect v1) (xcor-vect v2))
     (f (ycor-vect v1) (ycor-vect v2)))))

(define add-vect (manipulate-vect +))
(define sub-vect (manipulate-vect -))

(define (scale-vect v s)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))
(define (make-segment v1 v2)
  (list v1 v2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cadr s))

(define (frame-base frame)
  (make-segment (frame-origin frame) (add-vect (frame-origin frame) (frame-edge1 frame))))
(define (frame-right frame)
  (make-segment (add-vect (frame-origin frame) (frame-edge1 frame)) (add-vect (frame-origin frame) (add-vect (frame-edge1 frame) (frame-edge2 frame)))))
(define (frame-top frame)
  (make-segment (add-vect (frame-origin frame) (frame-edge2 frame)) (add-vect (frame-origin frame) (add-vect (frame-edge1 frame) (frame-edge2 frame)))))
(define (frame-left frame)
  (make-segment (frame-origin frame) (add-vect (frame-origin frame) (frame-edge2 frame))))


(define (outline-painter frame)
  (let ((base (frame-base frame))
	(right (frame-right frame))
	(top (frame-top frame))
	(left (frame-left frame)))
    ((segments->painter (list base right top left)) frame)))

(define (x-painter frame)
  (let ((bottom-left (frame-origin frame))
	(bottom-right (add-vect (frame-origin-frame) (frame-edge1 frame)))
	(top-left (add-vect (frame-origin frame) (frame-edge2 frame)))
	(top-right (add-vect (frame-origin frame) (add-vect (frame-edge1 frame) (frame-edge2 frame)))))
    (let ((bottom-left-to-top-right (make-segment bottom-left top-right))
	  (bottom-right-to-top-left (make-segment bottom-right top-left)))
      ((segments->painter (list bottom-left-to-top-right bottom-right-to-top-left)) frame))))
