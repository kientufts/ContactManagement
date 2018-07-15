package com.iansky.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iansky.spring.entity.Contact;

@Repository
public class ContactDAOImpl implements ContactDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Contact> getContacts() {
		Session session = sessionFactory.getCurrentSession();
		Query<Contact> query = session.createQuery("from Contact order by lastName", Contact.class);
		List<Contact> contacts = query.getResultList();
		return contacts;
	}

	@Override
	public void addContact(Contact contact) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(contact);
	}

	@Override
	public Contact getContact(int contactId) {
		Session session = sessionFactory.getCurrentSession();
		Contact contact = session.get(Contact.class, contactId);
		return contact;
	}

}
